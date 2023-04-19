(function_item) @local.scope
(closure_expression) @local.scope

(parameter pattern: (identifier) @local.definition)
(closure_parameters (identifier) @local.definition)
(closure_parameters (tuple_pattern (identifier) @local.definition))
(closure_parameters (struct_pattern (field_pattern pattern: (identifier) @local.definition)))
(closure_parameters (struct_pattern (field_pattern (shorthand_field_identifier) @local.definition)))

(let_declaration pattern: (identifier) @local.definition)

(identifier) @local.reference
