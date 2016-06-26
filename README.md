# PureScript Easings [![Build Status](https://travis-ci.org/i-am-tom/purescript-easings.svg?branch=master)](https://travis-ci.org/i-am-tom/purescript-easings)

The standard set of easing functions implemented in PureScript. Adapted from [jQuery Easing](https://github.com/gdsmith/jquery.easing), which was most likely stolen from Robert Penner's [Programming Macromedia Flash MX](https://www.amazon.com/Robert-Penners-Programming-Macromedia-Flash/dp/0072223561/175-5593647-3662611?ie=UTF8&tag=stackoverfl08-20).

Unlike the jQuery library, only the ease-in functions are explicitly given. In lieu of the others, two functions, `out` and `inAndOut` have been written, which transform the other easing functions appropriately.

## API

The `Easing` type is `Start -> End -> Progress -> Result`, where all four are `Number`s.

| Function | Signature | Description |
| -- | -- | -- |
| `polynomial` | `Number -> Easing` | Takes the power to which to raise `progress`. |
| `sine` | `Easing` | Standard sinusoidal easing. |
| `exponential` | `Easing` | Exponential easing. |
| `circular` | `Easing` | Follows a regular arc. |
| `elastic` | `Easing` | 'Spring' effect around the end. |
| `back` | `Easing` | Pulls back before transition. |
| `bounce` | `Easing` | `in`/`out` are reversed. |

All of these can be seen on [easings.net](http://www.easings.net), though do note that `bounce` has been flipped. This could change in the future, though I think it makes more sense to be this way round. Go figure.

## Contributing

Please submit PRs! All are welcome! I'll try to put some issues up to give some ideas.
