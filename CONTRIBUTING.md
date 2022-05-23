# Contributing

If you would like to contribute, please make sure your code contains the following:

- Helpful comments
- As little extra dependencies as humanly possible
- Code that is lightweight and as efficient as you can
- Well named variables & functions

## Styling the code

### Tools & Libraries

pokeget uses [shfmt](https://github.com/mvdan/sh) to style it's code. You can use whatever wrapper you would like, as long as it still internally uses shfmt.

For example you can use [shell-format](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format) if you like [VSCode](https://code.visualstudio.com/), [emacs-shfmt](https://github.com/purcell/emacs-shfmt/) if you want to use [emacs](https://www.gnu.org/software/emacs/) and [format-shell](https://atom.io/packages/format-shell) if you want to use [atom](https://atom.io/).

A full list of wrappers can be found [here](https://github.com/mvdan/sh#related-projects).

### Comments

Comments should be capitalized with no period at the end. There should also be a space separating the `#` and the comment itself.

```bash
# Like this
```

There should be 1 empty newline before the comment and no empty newlines after the comment.

```bash
# Comment
do_thing "arg"

# Explaining
run_this_other_thing "arg" "$2"
```

The only exception to the amount of newlines before and after is if there is a group of things you would like to comment, such as multiple variables, then you should put an empty newline before **and** after.

```bash

# This group of things does something

thing="bob"
other_thing="alice"
third_thing="michael"

# Make directory to store cache
mkdir "/cache/dir/to/"
```

### Casing

Additionally, all functions and variables should be named in snake_case:

```bash

# My awesome function
function_name() {
    my_variable=1
}
```

## Errors & warnings

Please make sure your code passes **all** [shellcheck](https://www.shellcheck.net/)  checks and has no warnings or errors.

It should also have no warnings from [shfmt](https://github.com/mvdan/sh).

## General Guidelines for PR's

Please be nice, and straight to the point when making PR's. Explain what your adding in a sentence or two.

Also, PR's should be **100%** complete meaning I don't have to add something to make the PR functional.

It should also be **tested** manually.
