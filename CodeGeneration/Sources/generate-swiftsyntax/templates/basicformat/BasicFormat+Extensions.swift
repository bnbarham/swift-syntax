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
import SwiftSyntaxBuilder
import SyntaxSupport
import Utils

extension Child {
  var requiresLeadingSpace: Bool? {
    switch self.kind {
    case .token(_, let requiresLeadingSpace, _):
      return requiresLeadingSpace
    case .nodeChoices(let choices):
      for choice in choices {
        if let requiresLeadingSpace = choice.requiresLeadingSpace {
          return requiresLeadingSpace
        }
      }
    default:
      break
    }
    return nil
  }

  var requiresTrailingSpace: Bool? {
    switch self.kind {
    case .token(choices: _, _, let requiresTrailingSpace):
      return requiresTrailingSpace
    case .nodeChoices(let choices):
      for choice in choices {
        if let requiresTrailingSpace = choice.requiresTrailingSpace {
          return requiresTrailingSpace
        }
      }
    default:
      break
    }
    return nil
  }
}

let basicFormatExtensionsFile = SourceFileSyntax(leadingTrivia: copyrightHeader) {
  DeclSyntax("import SwiftSyntax")

  try! ExtensionDeclSyntax("public extension SyntaxProtocol") {
    DeclSyntax(
      """
      var requiresIndent: Bool {
        guard let keyPath = keyPathInParent else {
          return false
        }
        return keyPath.requiresIndent
      }
      """
    )
  }

  try! ExtensionDeclSyntax("public extension TokenSyntax") {
    try VariableDeclSyntax("var requiresLeadingNewline: Bool") {
      StmtSyntax(
        """
        if let keyPath = keyPathInParent, keyPath.requiresLeadingNewline {
          return true
        }
        """
      )

      DeclSyntax("var ancestor: Syntax = Syntax(self)")
      try WhileStmtSyntax("while let parent = ancestor.parent, parent.firstToken(viewMode: .sourceAccurate) == self") {
        try SwitchExprSyntax("switch ancestor.as(SyntaxEnum.self)") {
          for node in SYNTAX_NODES where !node.isBase {
            if node.elementsSeparatedByNewline {
              SwitchCaseSyntax("case .\(raw: node.swiftSyntaxKind):") {
                StmtSyntax("return true")
              }
            }
          }
          SwitchCaseSyntax("default:") {
            StmtSyntax("ancestor = parent")
          }
        }
      }

      StmtSyntax("return false")
    }

    try VariableDeclSyntax("var requiresLeadingSpace: Bool") {
      StmtSyntax(
        """
        if let keyPath = keyPathInParent, let requiresLeadingSpace = keyPath.requiresLeadingSpace {
          return requiresLeadingSpace
        }
        """
      )

      try SwitchExprSyntax("switch tokenKind") {
        for token in SYNTAX_TOKENS {
          if token.requiresLeadingSpace {
            SwitchCaseSyntax("case .\(raw: token.swiftKind):") {
              StmtSyntax("return true")
            }
          }
        }
        for keyword in KEYWORDS where keyword.requiresLeadingSpace {
          SwitchCaseSyntax("case .keyword(.\(raw: keyword.escapedName)):") {
            StmtSyntax("return true")
          }
        }
        SwitchCaseSyntax("default:") {
          StmtSyntax("return false")
        }
      }
    }

    try VariableDeclSyntax("var requiresTrailingSpace: Bool") {
      StmtSyntax(
        """
        if let keyPath = keyPathInParent, let requiresTrailingSpace = keyPath.requiresTrailingSpace {
          return requiresTrailingSpace
        }
        """
      )

      try SwitchExprSyntax("switch tokenKind") {
        for token in SYNTAX_TOKENS {
          if token.requiresTrailingSpace {
            SwitchCaseSyntax("case .\(raw: token.swiftKind):") {
              StmtSyntax("return true")
            }
          }
        }
        for keyword in KEYWORDS where keyword.requiresTrailingSpace {
          SwitchCaseSyntax("case .keyword(.\(raw: keyword.escapedName)):") {
            StmtSyntax("return true")
          }
        }
        SwitchCaseSyntax("default:") {
          StmtSyntax("return false")
        }
      }
    }
  }

  try! ExtensionDeclSyntax("fileprivate extension AnyKeyPath") {
    try VariableDeclSyntax("var requiresIndent: Bool") {
      try SwitchExprSyntax("switch self") {
        for node in SYNTAX_NODES where !node.isBase {
          for child in node.children where child.isIndented {
            SwitchCaseSyntax("case \\\(raw: node.type.syntaxBaseName).\(raw: child.swiftName):") {
              StmtSyntax("return true")
            }
          }
        }
        SwitchCaseSyntax("default:") {
          StmtSyntax("return false")
        }
      }
    }

    try VariableDeclSyntax("var requiresLeadingNewline: Bool") {
      try SwitchExprSyntax("switch self") {
        for node in SYNTAX_NODES where !node.isBase {
          for child in node.children where child.requiresLeadingNewline {
            SwitchCaseSyntax("case \\\(raw: node.type.syntaxBaseName).\(raw: child.swiftName):") {
              StmtSyntax("return true")
            }
          }
        }
        SwitchCaseSyntax("default:") {
          StmtSyntax("return false")
        }
      }
    }

    try VariableDeclSyntax("var requiresLeadingSpace: Bool?") {
      try SwitchExprSyntax("switch self") {
        for node in SYNTAX_NODES where !node.isBase {
          for child in node.children {
            if let requiresLeadingSpace = child.requiresLeadingSpace {
              SwitchCaseSyntax("case \\\(raw: node.type.syntaxBaseName).\(raw: child.swiftName):") {
                StmtSyntax("return \(literal: requiresLeadingSpace)")
              }
            }
          }
        }
        SwitchCaseSyntax("default:") {
          StmtSyntax("return nil")
        }
      }
    }

    try VariableDeclSyntax("var requiresTrailingSpace: Bool?") {
      try SwitchExprSyntax("switch self") {
        for node in SYNTAX_NODES where !node.isBase {
          for child in node.children {
            if let requiresTrailingSpace = child.requiresTrailingSpace {
              SwitchCaseSyntax("case \\\(raw: node.type.syntaxBaseName).\(raw: child.swiftName):") {
                StmtSyntax("return \(literal: requiresTrailingSpace)")
              }
            }
          }
        }
        SwitchCaseSyntax("default:") {
          StmtSyntax("return nil")
        }
      }
    }
  }
}
