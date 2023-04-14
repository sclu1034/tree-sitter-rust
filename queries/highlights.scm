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

(use_declaration
    argument: (identifier) @module)
((use_declaration
    argument: (scoped_identifier
        name: (identifier) @module))
    (#match? @module "^[a-z]"))
(scoped_identifier
    path: (identifier) @module)
(scoped_identifier
    path: (scoped_identifier) @module)
(scoped_use_list
    path: (identifier) @module)

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

"(" @punctuation.parenthesis
")" @punctuation.parenthesis
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.brace
"}" @punctuation.brace

(type_arguments
  "<" @punctuation.angle
  ">" @punctuation.angle)
(type_parameters
  "<" @punctuation.angle
  ">" @punctuation.angle)

"::" @punctuation.double_colon
":" @punctuation.colon
"." @punctuation.dot
"," @punctuation.comma
";" @punctuation.semicolon

(parameter (identifier) @variable.parameter)

(lifetime (identifier) @label)

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

(attribute_item) @attribute
(inner_attribute_item) @attribute.inner

"*" @operator.asterisk
"&" @operator.ampersand
"'" @punctuation.quote
