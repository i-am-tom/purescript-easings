# PureScript Easings [![Build Status](https://travis-ci.org/i-am-tom/purescript-easings.svg?branch=master)](https://travis-ci.org/i-am-tom/purescript-easings)

The standard set of easing functions implemented in PureScript. Adapted from [jQuery Easing](https://github.com/gdsmith/jquery.easing), which was most likely stolen from Robert Penner's [Programming Macromedia Flash MX](https://www.amazon.com/Robert-Penners-Programming-Macromedia-Flash/dp/0072223561/175-5593647-3662611?ie=UTF8&tag=stackoverfl08-20). There are no new ideas in programming.

Unlike the jQuery library, only the ease-in functions are explicitly given. To keep things Dynamic™ and Maintanable™, `out` and `inAndOut` exist, which transform the other easing functions into out-easing and symmetrically-easing functions, respectively. You want elastic easing on the way out? `out elastic` is the function for you! Want to bounce off the walls? `inAndOut bounce` just might make your day.

## API

The `Easing` type is `Start -> End -> Progress -> Result`, where all four are `Number`s.

| Function | Signature | Description |
| --- | --- | --- |
| `polynomial` | `Number -> Easing` | Takes the power to which to raise `progress`. |
| `sine` | `Easing` | Standard sinusoidal easing. |
| `exponential` | `Easing` | Exponential easing. |
| `circular` | `Easing` | Follows a regular arc. |
| `elastic` | `Easing` | 'Spring' effect around the end. |
| `back` | `Easing` | Pulls back before transition. |
| `bounce` | `Easing` | `in`/`out` are reversed. |

All of these can be seen on [easings.net](http://www.easings.net), though do note that `bounce` has been flipped. You'll see why when you look at the demo; what bounces on the way _in_? It's pretty weird, friend.

## Contributing

Please submit PRs! All are welcome! I'll try to put some issues up to give some ideas.
