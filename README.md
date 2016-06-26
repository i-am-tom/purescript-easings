# PureScript Easings [![Build Status](https://travis-ci.org/i-am-tom/purescript-easings.svg?branch=master)](https://travis-ci.org/i-am-tom/purescript-easings)

The standard set of easing functions implemented in PureScript. Adapted from [jQuery Easing](https://github.com/gdsmith/jquery.easing), which was most likely stolen from Robert Penner's [Programming Macromedia Flash MX](https://www.amazon.com/Robert-Penners-Programming-Macromedia-Flash/dp/0072223561/175-5593647-3662611?ie=UTF8&tag=stackoverfl08-20).

Unlike the jQuery library, only the ease-in functions are explicitly given. In lieu of the others, two functions, `out` and `inAndOut` have been written, which transform the other easing functions appropriately.

## API

```purescript
type Easing = Number -> Number -> Number -> Number
```

| Function | Signature | Description |
| -- | -- | -- |
| `polynomial` |
