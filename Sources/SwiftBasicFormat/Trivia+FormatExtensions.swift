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

extension Trivia {
  var startsWithBlank: Bool {
    return pieces.first?.isBlank ?? false
  }

  var endsWithBlank: Bool {
    return pieces.last?.isBlank ?? false
  }

  var containsNewline: Bool {
    return pieces.contains { piece in
      return piece.isNewline
    }
  }

  var trimTrailingBlanks: Trivia {
    var blanks = 0
    for piece in pieces.reversed() {
      if !piece.isBlank {
        break
      }
      blanks += 1
    }
    return Trivia(pieces: pieces.dropLast(blanks))
  }

  /// Merges `indentation` into the trivia of each non-empty newline within
  /// this trivia. Pass `isOnNewline` if this trivia is itself on a newline,
  /// which will also merge `indentatation` into trivia prior to a newline.
  func indented(indentation: Trivia, isOnNewline: Bool = false) -> Trivia {
    guard !isEmpty else {
      if isOnNewline {
        return indentation
      }
      return self
    }

    var indentedPieces: [TriviaPiece] = []
    let splitTrivia = split(on: { $0.isNewline })
    for (index, slice) in splitTrivia.enumerated() {
      if !(slice.first?.isNewline ?? false), index > 0 || isOnNewline {
        indentedPieces.append(contentsOf: Trivia(pieces: slice).merging(indentation))
      } else {
        indentedPieces.append(contentsOf: slice)
      }
    }

    if splitTrivia.last?.first?.isNewline ?? false {
      indentedPieces.append(contentsOf: indentation)
    }

    return Trivia(pieces: indentedPieces)
  }

  /// Split this trivia on the given closure. The split piece is still added
  /// to the resulting split.
  func split(on shouldSplit: (TriviaPiece) -> Bool) -> [Slice<Trivia>] {
    var result: [Slice<Trivia>] = []

    func addSplit(to index: Int) {
      let start = result.last?.endIndex ?? 0
      if index > start {
        result.append(self[start..<index])
      }
    }

    for (index, piece) in pieces.enumerated() {
      if shouldSplit(piece) {
        addSplit(to: index)
        result.append(self[index...index])
      }
    }

    if result.last?.endIndex != endIndex {
      addSplit(to: pieces.count)
    }

    return result
  }
}
