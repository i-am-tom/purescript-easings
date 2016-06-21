module Main where

import Prelude
import Math (pi, sin, cos, pow)

type Start    = Number
type End      = Number
type Progress = Number

type Easing = Start -> End -> Progress -> Number

infix 9 pow as ^

out :: Easing -> Easing
out f start end progress = f end start (1.0 - progress)

inAndOut :: Easing -> Easing
inAndOut fIn start end progress = if progress < 0.5
  then fIn start (end / 2.0) (progress * 2.0)
  else (out fIn) ((start + end) / 2.0) end (2.0 * progress - 1.0)

-- Exponential easing.
exponential :: Number -> Easing
exponential power start end progress =
  progress ^ power * (end - start) + start

-- Sinusoidal easing.
sine :: Easing
sine start end = (+) end
  <<< (*) (start - end)
  <<< cos <<< (*) (pi / 2.0)
