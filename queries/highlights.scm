; Identifier conventions

; Assume all-caps names are constants
((identifier) @constant
 (#match? @constant "^[A-Z][A-Z\\d_]+$'"))

; Assume that uppercase names in paths are types
((scoped_identifier
  path: (identifier) @type)
 (#match? @type "^[A-Z]"))
((scoped_identifier
  path: (scoped_identifier
    name: (identifier) @type))
 (#match? @type "^[A-Z]"))
((scoped_type_identifier
  path: (identifier) @type)
 (#match? @type "^[A-Z]"))
((scoped_type_identifier
  path: (scoped_identifier
    name: (identifier) @type))
 (#match? @type "^[A-Z]"))

; Modules in paths
; Highlight the module in scoped identifiers with just two elements (e.g. `use std::fmt`);
(scoped_identifier
    path: (identifier) @module)
; Highlight the module in scoped identifiers with more than two elements
(scoped_identifier
    path: (scoped_identifier) @module)
; Highlight paths that import a module rather than a type
((use_declaration
    argument: (scoped_identifier
        name: (identifier) @module))
    (#match? @module "^[a-z]"))
; Highlight the module in paths before a list of imports
(scoped_use_list
    path: (identifier) @module)
; Highlight modules in a list of imports
((use_list
    (identifier) @module)
    (#match? @module "^[a-z]"))
; Highlight module in type paths
((scoped_type_identifier
  path: (identifier) @module)
 (#match? @module "^[a-z]"))

; Assume other uppercase names are enum constructors
((identifier) @constructor
 (#match? @constructor "^[A-Z]"))

; Assume all qualified names in struct patterns are enum constructors. (They're
; either that, or struct names; highlighting both as constructors seems to be
; the less glaring choice of error, visually.)
(struct_pattern
  type: (scoped_type_identifier
    name: (type_identifier) @constructor))

; Function calls

(call_expression
  function: (identifier) @function)
(call_expression
  function: (field_expression
    field: (field_identifier) @function.method))
(call_expression
  function: (scoped_identifier
    "::"
    name: (identifier) @function))

(generic_function
  function: (identifier) @function)
(generic_function
  function: (scoped_identifier
    name: (identifier) @function))
(generic_function
  function: (field_expression
    field: (field_identifier) @function.method))

(macro_invocation
  macro: (identifier) @function.macro
  "!" @function.macro.exclamation)

; Function definitions

(function_item (identifier) @function)
(function_signature_item (identifier) @function)

; Other identifiers

(type_identifier) @type
(primitive_type) @type.builtin
(field_identifier) @property

(line_comment) @comment
(block_comment) @comment

(attribute_item
    (
        "#" @attribute.numbersign
        "[" @attribute.bracket.opening
        (attribute)+ @attribute.item
        "]" @attribute.bracket.closing
    )
)
(inner_attribute_item) @attribute.inner

(parameter (identifier) @variable.parameter)

(lifetime (identifier) @label.lifetime)

(self) @variable.builtin.self
(use_list (self) @variable.builtin.self)
(scoped_use_list (self) @variable.builtin.self)
(scoped_identifier (self) @variable.builtin.self)

(char_literal) @string.char
(string_literal) @string.string
(raw_string_literal) @string.raw

(boolean_literal) @constant.builtin.boolean
(integer_literal) @constant.builtin.integer
(float_literal) @constant.builtin.float

(escape_sequence) @escape

(binary_expression "*" @operator.math.multiply)
(binary_expression "+" @operator.math.add)
(binary_expression "-" @operator.math.subtract)
(binary_expression "/" @operator.math.divide)
(binary_expression "%" @operator.math.modulo)
(unary_expression "-" @operator.math.subtract)

(binary_expression "|" @operator.bitwise.or)
(binary_expression "&" @operator.bitwise.and)
(binary_expression "^" @operator.bitwise.xor)
(binary_expression "<<" @operator.bitwise.left_shift)
(binary_expression ">>" @operator.bitwise.right_shift)

(binary_expression "&&" @operator.boolean.double_ampersand)
(binary_expression "||" @operator.boolean.double_pipe)
(unary_expression "!" @operator.boolean.not)

(try_expression "?" @operator.try)

(range_expression ".." @operator.range.range)
(range_expression "..=" @operator.range.inclusive)

(reference_type "&" @operator.ampersand)
(self_parameter "&" @operator.ampersand)
(reference_expression "&" @operator.ampersand)
(unary_expression "*" @operator.dereference)

(binary_expression "==" @operator.comparison.equals)
(binary_expression "!=" @operator.comparison.not_equals)
(binary_expression ">=" @operator.comparison.greater_or_equal)
(binary_expression "<=" @operator.comparison.less_or_equal)
(binary_expression "<" @operator.comparison.less)
(binary_expression ">" @operator.comparison.greater)

(assignment_expression "=" @operator.assignment.equals)
(compound_assignment_expr "+=" @operator.assignment.add)
(compound_assignment_expr "-=" @operator.assignment.subtract)
(compound_assignment_expr "*=" @operator.assignment.multiply)
(compound_assignment_expr "/=" @operator.assignment.divide)
(compound_assignment_expr "%=" @operator.assignment.modulo)
(compound_assignment_expr "&=" @operator.assignment.and)
(compound_assignment_expr "|=" @operator.assignment.or)
(compound_assignment_expr "^=" @operator.assignment.xor)
(compound_assignment_expr "<<=" @operator.assignment.left_shift)
(compound_assignment_expr ">>=" @operator.assignment.right_shift)

(function_item "->" @operator.return)
(match_arm "=>" @operator.arm)

"'" @punctuation.quote

"(" @punctuation.parenthesis.opening
")" @punctuation.parenthesis.closing
"[" @punctuation.bracket.opening
"]" @punctuation.bracket.closing
"{" @punctuation.brace.opening
"}" @punctuation.brace.closing

(type_arguments
  "<" @punctuation.angle.opening
  ">" @punctuation.angle.closing)
(type_parameters
  "<" @punctuation.angle.opening
  ">" @punctuation.angle.closing)

"::" @punctuation.double_colon
":" @punctuation.colon
"." @punctuation.dot
".." @punctuation.double_dot
"," @punctuation.comma
";" @punctuation.semicolon

"as" @keyword
"async" @keyword
"await" @keyword
"break" @keyword
"const" @keyword
"continue" @keyword
"default" @keyword
"dyn" @keyword
"else" @keyword
"enum" @keyword
"extern" @keyword
"fn" @keyword
"for" @keyword
"if" @keyword
"impl" @keyword
"in" @keyword
"let" @keyword
"loop" @keyword
"macro_rules!" @keyword
"match" @keyword
"mod" @keyword
"move" @keyword
"pub" @keyword
"ref" @keyword
"return" @keyword
"static" @keyword
"struct" @keyword
"trait" @keyword
"type" @keyword
"union" @keyword
"unsafe" @keyword
"use" @keyword
"where" @keyword
"while" @keyword
(crate) @keyword
(mutable_specifier) @keyword
(super) @keyword
