//// Automatically generated by generate-swiftsyntax
//// Do not edit directly!
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

private func childNameForDiagnostics(_ keyPath: AnyKeyPath) -> String? {
  switch keyPath {
  case \AccessorDeclSyntax.attributes:
    return "attributes"
  case \AccessorDeclSyntax.modifier:
    return "modifiers"
  case \AccessorDeclSyntax.parameter:
    return "parameter"
  case \AccessorParameterSyntax.name:
    return "name"
  case \ActorDeclSyntax.attributes:
    return "attributes"
  case \ActorDeclSyntax.modifiers:
    return "modifiers"
  case \ActorDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \ActorDeclSyntax.inheritanceClause:
    return "type inheritance clause"
  case \ActorDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \ArrayElementSyntax.expression:
    return "value"
  case \AssociatedtypeDeclSyntax.attributes:
    return "attributes"
  case \AssociatedtypeDeclSyntax.modifiers:
    return "modifiers"
  case \AssociatedtypeDeclSyntax.inheritanceClause:
    return "inheritance clause"
  case \AssociatedtypeDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \AttributeSyntax.attributeName:
    return "name"
  case \AvailabilityEntrySyntax.label:
    return "label"
  case \AvailabilityLabeledArgumentSyntax.label:
    return "label"
  case \AvailabilityLabeledArgumentSyntax.value:
    return "value"
  case \AvailabilityVersionRestrictionSyntax.platform:
    return "platform"
  case \AvailabilityVersionRestrictionSyntax.version:
    return "version"
  case \BreakStmtSyntax.label:
    return "label"
  case \ClassDeclSyntax.attributes:
    return "attributes"
  case \ClassDeclSyntax.modifiers:
    return "modifiers"
  case \ClassDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \ClassDeclSyntax.inheritanceClause:
    return "inheritance clause"
  case \ClassDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \ClosureParamSyntax.name:
    return "name"
  case \ClosureParameterClauseSyntax.parameterList:
    return "parameters"
  case \ClosureParameterSyntax.attributes:
    return "attributes"
  case \ClosureParameterSyntax.modifiers:
    return "modifiers"
  case \ClosureParameterSyntax.type:
    return "type"
  case \ClosureSignatureSyntax.attributes:
    return "attributes"
  case \CodeBlockSyntax.statements:
    return "statements"
  case \ContinueStmtSyntax.label:
    return "label"
  case \DeclNameSyntax.declBaseName:
    return "base name"
  case \DeclNameSyntax.declNameArguments:
    return "arguments"
  case \DeinitializerDeclSyntax.attributes:
    return "attributes"
  case \DeinitializerDeclSyntax.modifiers:
    return "modifiers"
  case \DictionaryElementSyntax.keyExpression:
    return "key"
  case \DictionaryElementSyntax.valueExpression:
    return "value"
  case \DictionaryTypeSyntax.keyType:
    return "key type"
  case \DictionaryTypeSyntax.valueType:
    return "value type"
  case \DifferentiabilityParamsClauseSyntax.parameters:
    return "parameters"
  case \DoStmtSyntax.body:
    return "body"
  case \DocumentationAttributeArgumentSyntax.label:
    return "label"
  case \EnumCaseDeclSyntax.attributes:
    return "attributes"
  case \EnumCaseDeclSyntax.modifiers:
    return "modifiers"
  case \EnumCaseDeclSyntax.elements:
    return "elements"
  case \EnumCaseElementSyntax.associatedValue:
    return "associated values"
  case \EnumCaseParameterClauseSyntax.parameterList:
    return "parameters"
  case \EnumCaseParameterSyntax.modifiers:
    return "modifiers"
  case \EnumCaseParameterSyntax.type:
    return "type"
  case \EnumCaseParameterSyntax.defaultArgument:
    return "default argument"
  case \EnumDeclSyntax.attributes:
    return "attributes"
  case \EnumDeclSyntax.modifiers:
    return "modifiers"
  case \EnumDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \EnumDeclSyntax.inheritanceClause:
    return "inheritance clause"
  case \EnumDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \ExtensionDeclSyntax.attributes:
    return "attributes"
  case \ExtensionDeclSyntax.modifiers:
    return "modifiers"
  case \ExtensionDeclSyntax.inheritanceClause:
    return "inheritance clause"
  case \ExtensionDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \ForInStmtSyntax.body:
    return "body"
  case \FunctionCallExprSyntax.calledExpression:
    return "called expression"
  case \FunctionCallExprSyntax.argumentList:
    return "arguments"
  case \FunctionCallExprSyntax.trailingClosure:
    return "trailing closure"
  case \FunctionCallExprSyntax.additionalTrailingClosures:
    return "trailing closures"
  case \FunctionDeclSyntax.attributes:
    return "attributes"
  case \FunctionDeclSyntax.modifiers:
    return "modifiers"
  case \FunctionDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \FunctionDeclSyntax.signature:
    return "function signature"
  case \FunctionDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \FunctionParameterSyntax.attributes:
    return "attributes"
  case \FunctionParameterSyntax.modifiers:
    return "modifiers"
  case \FunctionParameterSyntax.secondName:
    return "internal name"
  case \FunctionParameterSyntax.type:
    return "type"
  case \FunctionParameterSyntax.defaultArgument:
    return "default argument"
  case \GenericParameterSyntax.each:
    return "parameter pack specifier"
  case \GenericParameterSyntax.name:
    return "name"
  case \GenericParameterSyntax.inheritedType:
    return "inherited type"
  case \GuardStmtSyntax.conditions:
    return "condition"
  case \GuardStmtSyntax.body:
    return "body"
  case \IfConfigClauseSyntax.condition:
    return "condition"
  case \IfExprSyntax.body:
    return "body"
  case \IfExprSyntax.elseBody:
    return "else body"
  case \ImplementsAttributeArgumentsSyntax.type:
    return "type"
  case \ImplementsAttributeArgumentsSyntax.declBaseName:
    return "declaration base name"
  case \ImplementsAttributeArgumentsSyntax.declNameArguments:
    return "declaration name arguments"
  case \ImportDeclSyntax.attributes:
    return "attributes"
  case \ImportDeclSyntax.modifiers:
    return "modifiers"
  case \ImportPathComponentSyntax.name:
    return "name"
  case \InitializerDeclSyntax.attributes:
    return "attributes"
  case \InitializerDeclSyntax.modifiers:
    return "modifiers"
  case \InitializerDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \InitializerDeclSyntax.signature:
    return "function signature"
  case \InitializerDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \KeyPathExprSyntax.root:
    return "root"
  case \KeyPathSubscriptComponentSyntax.argumentList:
    return "arguments"
  case \LabeledSpecializeEntrySyntax.label:
    return "label"
  case \LabeledSpecializeEntrySyntax.value:
    return "value"
  case \LabeledStmtSyntax.labelName:
    return "label name"
  case \LayoutRequirementSyntax.typeIdentifier:
    return "constrained type"
  case \LayoutRequirementSyntax.size:
    return "size"
  case \LayoutRequirementSyntax.alignment:
    return "alignment"
  case \MacroDeclSyntax.attributes:
    return "attributes"
  case \MacroDeclSyntax.modifiers:
    return "modifiers"
  case \MacroDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \MacroDeclSyntax.signature:
    return "macro signature"
  case \MacroDeclSyntax.definition:
    return "macro definition"
  case \MacroDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \MacroExpansionDeclSyntax.attributes:
    return "attributes"
  case \MacroExpansionDeclSyntax.modifiers:
    return "modifiers"
  case \MemberAccessExprSyntax.base:
    return "base"
  case \MemberAccessExprSyntax.name:
    return "name"
  case \MemberTypeIdentifierSyntax.baseType:
    return "base type"
  case \MemberTypeIdentifierSyntax.name:
    return "name"
  case \MetatypeTypeSyntax.baseType:
    return "base type"
  case \MultipleTrailingClosureElementSyntax.label:
    return "label"
  case \ObjCSelectorPieceSyntax.name:
    return "name"
  case \OperatorDeclSyntax.fixity:
    return "fixity"
  case \OperatorPrecedenceAndTypesSyntax.precedenceGroup:
    return "precedence group"
  case \ParameterClauseSyntax.parameterList:
    return "parameters"
  case \PatternBindingSyntax.typeAnnotation:
    return "type annotation"
  case \PoundSourceLocationArgsSyntax.fileName:
    return "file name"
  case \PoundSourceLocationArgsSyntax.lineNumber:
    return "line number"
  case \PoundSourceLocationSyntax.args:
    return "arguments"
  case \PrecedenceGroupDeclSyntax.attributes:
    return "attributes"
  case \PrecedenceGroupDeclSyntax.modifiers:
    return "modifiers"
  case \PrecedenceGroupNameElementSyntax.name:
    return "name"
  case \PrimaryAssociatedTypeSyntax.name:
    return "name"
  case \ProtocolDeclSyntax.attributes:
    return "attributes"
  case \ProtocolDeclSyntax.modifiers:
    return "modifiers"
  case \ProtocolDeclSyntax.primaryAssociatedTypeClause:
    return "primary associated type clause"
  case \ProtocolDeclSyntax.inheritanceClause:
    return "inheritance clause"
  case \ProtocolDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \QualifiedDeclNameSyntax.baseType:
    return "base type"
  case \QualifiedDeclNameSyntax.name:
    return "base name"
  case \QualifiedDeclNameSyntax.arguments:
    return "arguments"
  case \RepeatWhileStmtSyntax.body:
    return "body"
  case \RepeatWhileStmtSyntax.condition:
    return "condition"
  case \ReturnClauseSyntax.returnType:
    return "return type"
  case \SameTypeRequirementSyntax.leftTypeIdentifier:
    return "left-hand type"
  case \SameTypeRequirementSyntax.rightTypeIdentifier:
    return "right-hand type"
  case \StructDeclSyntax.attributes:
    return "attributes"
  case \StructDeclSyntax.modifiers:
    return "modifiers"
  case \StructDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \StructDeclSyntax.inheritanceClause:
    return "type inheritance clause"
  case \StructDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \SubscriptDeclSyntax.attributes:
    return "attributes"
  case \SubscriptDeclSyntax.modifiers:
    return "modifiers"
  case \SubscriptDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \SubscriptDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \SubscriptExprSyntax.calledExpression:
    return "called expression"
  case \SubscriptExprSyntax.argumentList:
    return "arguments"
  case \SubscriptExprSyntax.trailingClosure:
    return "trailing closure"
  case \SubscriptExprSyntax.additionalTrailingClosures:
    return "trailing closures"
  case \SwitchCaseSyntax.label:
    return "label"
  case \TargetFunctionEntrySyntax.label:
    return "label"
  case \TargetFunctionEntrySyntax.declname:
    return "declaration name"
  case \TernaryExprSyntax.conditionExpression:
    return "condition"
  case \TernaryExprSyntax.firstChoice:
    return "first choice"
  case \TernaryExprSyntax.secondChoice:
    return "second choice"
  case \TupleExprElementSyntax.label:
    return "label"
  case \TupleExprElementSyntax.expression:
    return "value"
  case \TuplePatternElementSyntax.labelName:
    return "label"
  case \TupleTypeElementSyntax.name:
    return "name"
  case \TupleTypeElementSyntax.secondName:
    return "internal name"
  case \TypeInitializerClauseSyntax.value:
    return "type"
  case \TypealiasDeclSyntax.attributes:
    return "attributes"
  case \TypealiasDeclSyntax.modifiers:
    return "modifiers"
  case \TypealiasDeclSyntax.genericParameterClause:
    return "generic parameter clause"
  case \TypealiasDeclSyntax.genericWhereClause:
    return "generic where clause"
  case \VariableDeclSyntax.attributes:
    return "attributes"
  case \VariableDeclSyntax.modifiers:
    return "modifiers"
  default:
    return nil
  }
}

extension SyntaxProtocol {
  var childNameInParent: String? {
    guard let keyPath = self.keyPathInParent else {
      return nil
    }
    return childNameForDiagnostics(keyPath)
  }
}
