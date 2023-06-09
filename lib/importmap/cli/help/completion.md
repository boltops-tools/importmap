## Examples

    importmap completion

Prints words for TAB auto-completion.

    importmap completion
    importmap completion hello
    importmap completion hello name

To enable, TAB auto-completion add the following to your profile:

    eval $(importmap completion_script)

Auto-completion example usage:

    importmap [TAB]
    importmap hello [TAB]
    importmap hello name [TAB]
    importmap hello name --[TAB]
