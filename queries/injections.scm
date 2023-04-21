; Macros from crates that parse syntax that we can inject, like Yew's `html!`
((macro_invocation
  macro: (identifier) @_name
  (token_tree) @injection.content)
 (#match? @_name "^html$")
 (#set! injection.language "html")
 (#set! injection.include-children))

((macro_invocation
  macro: (identifier) @_name
  (token_tree) @injection.content)
 (#match? @_name "^python$")
 (#set! injection.language "python")
 (#set! injection.include-children))

((macro_invocation
  macro: (identifier) @_name
  (token_tree) @injection.content)
 (#match? @_name "^json$")
 (#set! injection.language "json")
 (#set! injection.include-children))

((macro_invocation
  macro: (identifier) @_name
  (token_tree) @injection.content)
 (#match? @_name "^toml$")
 (#set! injection.language "toml")
 (#set! injection.include-children))

((macro_invocation
  macro: (identifier) @_name
  (token_tree) @injection.content)
 (#match? @_name "^lua|compile_inline_teal$")
 (#set! injection.language "lua")
 (#set! injection.include-children))

; `chunk!` is rather generic, so we only match the full path
((macro_invocation
  macro: (scoped_identifier) @_name
  (token_tree) @injection.content)
 (#match? @_name "^mlua::chunk|lua|compile_inline_teal$")
 (#set! injection.language "lua")
 (#set! injection.include-children))

((macro_invocation
  (token_tree) @injection.content)
 (#set! injection.language "rust")
 (#set! injection.include-children))

((macro_rule
  (token_tree) @injection.content)
 (#set! injection.language "rust")
 (#set! injection.include-children))

((attribute
  . (identifier) @_name
  . (token_tree) @injection.content)
 (#set! injection.language "rust")
 (#set! injection.include-children))
