module Main where

import Prelude
import Math (pi, sin, cos, pow)

type Easing = Number -> Number -> Number -> Number

out :: Easing -> Easing
out f start end progress = f end start (1.0 - progress)

inAndOut :: Easing -> Easing
inAndOut f start end progress = if progress < 0.5
  then f start (end / 2.0) (progress * 2.0)
  else (out f) ((start + end) / 2.0) end (2.0 * progress - 1.0)

-- Polynomial easing.
polynomial :: Number -> Easing
polynomial power start end progress =
  (pow progress power) * (end - start) + start

-- Sinusoidal easing.
sine :: Easing
sine start end = (+) end
  <<< (*) (start - end)
  <<< cos <<< (*) (pi / 2.0)
