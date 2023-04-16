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

import SwiftBasicFormat
import SwiftParser
import SwiftSyntaxBuilder
import SwiftSyntax

import XCTest
import _SwiftSyntaxTestSupport

final class BasicFormatTest: XCTestCase {
  func testNotIndented() throws {
    let baseline: ExprSyntax = """
      func foo() {
      someFunc(a: 1,
      b: 1)
      }
      """

    let expectation = """
      func foo() {
          someFunc(a: 1,
              b: 1)
      }
      """

    assertStringsEqualWithDiff(baseline.formatted().description, expectation)
  }

  func testPartialIndent() throws {
    let baseline: ExprSyntax = """
      func foo() {
      someFunc(a: 1,
               b: 1)
      }
      """

    let expectation = """
      func foo() {
          someFunc(a: 1,
                   b: 1)
      }
      """

    assertStringsEqualWithDiff(baseline.formatted().description, expectation)
  }

  func testPartialIndentNested() throws {
    let baseline: ExprSyntax = """
      func outer() {
      func inner() {
      someFunc(a: 1,
               b: 1)
      }
      }
      """

    let expectation = """
      func outer() {
          func inner() {
              someFunc(a: 1,
                       b: 1)
          }
      }
      """

    assertStringsEqualWithDiff(baseline.formatted().description, expectation)
  }

  func testAlreadyIndented() throws {
    let baseline = """
      func foo() {
        someFunc(a: 1,
                 b: 1)
      }
      """

    assertStringsEqualWithDiff(ExprSyntax(stringLiteral: baseline).formatted().description, baseline)
  }

  func testClosureIndentationArgBefore() throws {
    let baseline: ExprSyntax = """
      someFunc(arg2: 1,
          closure: { arg in indented() })
      """

    let expectation = """
      someFunc(arg2: 1,
          closure: { arg in
              indented()
          })
      """

    assertStringsEqualWithDiff(baseline.formatted().description, expectation)
  }

  func testClosureIndentationAfter() throws {
    let baseline: ExprSyntax = """
      someFunc(closure: { arg in indented() },
          arg2: 1)
      """

    let expectation = """
      someFunc(closure: { arg in
          indented()
      },
      arg2: 1)
      """

    assertStringsEqualWithDiff(baseline.formatted().description, expectation)
  }
}
