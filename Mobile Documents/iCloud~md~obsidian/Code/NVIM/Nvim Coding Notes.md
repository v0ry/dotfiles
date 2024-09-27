# Spec Setup
> config is executed when the plugin loads. The default implementation will automatically run require(MAIN).setup(opts) if opts or config = true is set. Lazy uses several heuristics to determine the plugin's MAIN module automatically based on the plugin's name. (opts is the recommended way to configure plugins).

```
config = function() ... end,
```
[lazy.nvim](https://lazy.folke.io/spec/examples)