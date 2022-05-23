# Other similar projects

## Table of contents

- [Other similar projects](#other-similar-projects)
  - [Table of contents](#table-of-contents)
  - [pokemon-colorscripts](#pokemon-colorscripts)
    - [pokeget example](#pokeget-example)
    - [pokemon-colorscripts example](#pokemon-colorscripts-example)
  - [pokeshell](#pokeshell)
    - [Conclusion](#conclusion)

## [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/)

pokeget is not a clone of [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/), nor was inspired by it in the first place.

The true main difference is that [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/) gets its sprites from a folder stored locally while pokeget get's its sprites from the pokeget github repo.
This allows pokeget's sprites to be renamed, fixed, redone, and tweaked without any update necessary from the user. Due to this functionality, pokeget is slower by a factor of 5x.

[pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/) has been tested on macOS though, and while pokeget-lite could work theoretically on macOS it has not been tested.

When I googled about similar tools while I was developing the first version of pokeget I found [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/) and even used it as a source for a while.
But I continued developing pokeget because I generally had some issues with it and I thought it could be improved.

[pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/) has issues with its sprites with some of them appearing blurry, as well as a lack of some other features.
pokeget has already achieved feature parity with [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/), and generally has more features.

[pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/) is still a really cool program, but pokeget does fix some of its issues.

### pokeget example

![pokeget](https://github.com/talwat/pokeget/raw/main/examples/pokeget-and-pokemon-colorscripts/pokeget-moltres.png)

### pokemon-colorscripts example

![pokeget](https://github.com/talwat/pokeget/raw/main/examples/pokeget-and-pokemon-colorscripts/pokemon-colorscripts-moltres.png)

## [pokeshell](https://github.com/acxz/pokeshell)

[pokeshell](https://github.com/acxz/pokeshell) is another extremely cool project created by [acxz](https://github.com/acxz).

As listed in [pokeshell](https://github.com/acxz/pokeshell)'s page, it has a lot more features than pokeget, because it's functionally different.

pokeget fetches pre-converted sprites, which were converted with a python script, and displays them using a Unicode symbol and terminal colors.

[pokeshell](https://github.com/acxz/pokeshell) fetches normal png/gif files and converts them **client-side** with a program called [timg](https://github.com/hzeller/timg).

This offers a lot more flexibility with what you can do with the images, such as displaying animated sprites and resizing to the terminal. [pokeshell](https://github.com/acxz/pokeshell) also makes use of another program called [imagemagick](https://imagemagick.org/) to further edit images to display multiple pokemon at once.

These two tools allow a lot of image manipulation to be done super easily, which explains the features.
The downside to this is that it is slower (~1.6x).

This also adds a need for extra dependencies, and [pokeshell](https://github.com/acxz/pokeshell) also gets its pokemon sprites from external sources, while pokeget sticks to it's own repo.

[pokeget](https://github.com/talwat/pokeget) is also much more portable, and on many distro's works completely out of the box.
One of pokeget's main goals is to have as little dependencies as it can without compromising code quality.

[pokeshell](https://github.com/acxz/pokeshell) is compatible with macOS, while pokeget isn't fully compatible.

Unlike [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts/) which doesn't have that many benefits over pokeget, [pokeshell](https://github.com/acxz/pokeshell) does have some benefits. You can see [here](https://github.com/acxz/pokeshell#similar-projects) for a feature comparison in tabular form.

Also [pokeshell](https://github.com/acxz/pokeshell) has shell autocompletion, and pokeget doesn't.

### Conclusion

If you want to have a program which is more feature rich, then [pokeshell](https://github.com/acxz/pokeshell) is better. If you want something simple, fast, and low on dependencies, use pokeget.

Or better yet just use both.

I highly recommend you check out [pokeshell](https://github.com/acxz/pokeshell).

*Make sure to **star**, **watch**, and **fork** both projects ;)*
