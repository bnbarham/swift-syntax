//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2023 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import SwiftSyntax

open class BasicFormat: SyntaxRewriter {
  public var indentWidth: Int
  public var initialIndentation: Trivia
  public var indentationLevel: Int

  public var indentation: Trivia {
    initialIndentation.appending(Trivia.spaces(indentationLevel * indentWidth))

  }

  public var indentedNewline: Trivia {
    Trivia.newlines(1).appending(indentation)
  }

  public init(indentWidth: Int = 4, initialIndentation: Trivia = []) {
    self.indentWidth = indentWidth
    self.initialIndentation = initialIndentation
    self.indentationLevel = 0
  }

  open override func visitPre(_ node: Syntax) {
    if requiresIndent(node) {
      indentationLevel += 1
    }
  }

  open override func visitPost(_ node: Syntax) {
    if requiresIndent(node) {
      indentationLevel -= 1
    }
  }

  open override func visit(_ token: TokenSyntax) -> TokenSyntax {
    var leadingTrivia = token.leadingTrivia
    var trailingTrivia = token.trailingTrivia

    if let previousToken = token.previousToken(viewMode: .sourceAccurate) {
      if requiresLeadingNewline(token) {
        if !previousToken.trailingTrivia.containsNewline && !token.leadingTrivia.containsNewline {
          leadingTrivia = .newline + leadingTrivia
        }
      } else if requiresLeadingSpace(token) {
        if !requiresTrailingSpace(previousToken),
           !previousToken.trailingTrivia.endsWithBlank && !token.leadingTrivia.endsWithBlank {
          leadingTrivia += .space
        }
      }
    }

    if let nextToken = token.nextToken(viewMode: .sourceAccurate) {
      let addingNewline = requiresLeadingNewline(nextToken)
      if requiresTrailingSpace(token),
         !addingNewline && !token.trailingTrivia.endsWithBlank && !nextToken.leadingTrivia.startsWithBlank {
        trailingTrivia += .space
      }

      if addingNewline && !trailingTrivia.containsNewline {
        trailingTrivia = trailingTrivia.trimTrailingBlanks
      }
    }

    var isOnNewline: Bool = token.previousToken(viewMode: .sourceAccurate)?.trailingTrivia.pieces.last?.isNewline == true
    if case .stringSegment(let text) = token.previousToken(viewMode: .sourceAccurate)?.tokenKind {
      isOnNewline = isOnNewline || (text.last?.isNewline == true)
    }
    // TODO: Haven't tested the new function here, but since we're not merging
    // at all I suspect you'll be changing it entirely. So eh.
    leadingTrivia = leadingTrivia.indented(indentation: indentation, isOnNewline: isOnNewline)

    let rewritten = TokenSyntax(
        token.tokenKind,
        leadingTrivia: leadingTrivia,
        trailingTrivia: trailingTrivia,
        presence: token.presence
    )

    return rewritten
  }

  /// Whether a leading newline on `token` should be added.
  open func requiresIndent<T: SyntaxProtocol>(_ node: T) -> Bool {
    return node.requiresIndent
  }

  /// Whether a leading newline on `token` should be added.
  open func requiresLeadingNewline(_ token: TokenSyntax) -> Bool {
    var ancestor: Syntax = Syntax(token)
    while let parent = ancestor.parent {
      ancestor = parent
      if ancestor.is(ExpressionSegmentSyntax.self) {
        return false
      }
    }

    return token.requiresLeadingNewline
  }

  /// Whether a leading space on `token` should be added.
  open func requiresLeadingSpace(_ token: TokenSyntax) -> Bool {
    switch (token.previousToken(viewMode: .sourceAccurate)?.tokenKind, token.tokenKind) {
    case (.leftParen, .leftBrace): // Ensures there is not a space in `.map({ $0.foo })`
      return false
    default:
      break
    }

    return token.requiresLeadingSpace
  }

  /// Whether a trailing space on `token` should be added.
  open func requiresTrailingSpace(_ token: TokenSyntax) -> Bool {
    switch (token.tokenKind, token.nextToken(viewMode: .sourceAccurate)?.tokenKind) {
    case (.exclamationMark, .leftParen), // Ensures there is not a space in `myOptionalClosure!()`
         (.exclamationMark, .period), // Ensures there is not a space in `myOptionalBar!.foo()`
         (.keyword(.as), .exclamationMark), // Ensures there is not a space in `as!`
         (.keyword(.as), .postfixQuestionMark), // Ensures there is not a space in `as?`
         (.keyword(.try), .exclamationMark), // Ensures there is not a space in `try!`
         (.keyword(.try), .postfixQuestionMark), // Ensures there is not a space in `try?`:
         (.postfixQuestionMark, .leftParen), // Ensures there is not a space in `init?()` or `myOptionalClosure?()`s
         (.postfixQuestionMark, .rightAngle), // Ensures there is not a space in `ContiguousArray<RawSyntax?>`
         (.postfixQuestionMark, .rightParen): // Ensures there is not a space in `myOptionalClosure?()`
      return false
    default:
      break
    }

    return token.requiresTrailingSpace
  }
}
