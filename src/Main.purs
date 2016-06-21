module Main where

import Prelude
import Math

type Start    = Number
type End      = Number
type Progress = Number

type Easing = Start -> End -> Progress -> Number

infix 9 pow as ^

-- Exponential easings.

exponentialIn :: Number -> Easing
exponentialIn power start end progress =
  progress ^ power * (end - start) + start

exponentialOut :: Number -> Easing
exponentialOut power start end progress =
  exponentialIn power end start (1.0 - progress)

exponentialBoth :: Number -> Easing
exponentialBoth power start end progress = if progress < 0.5
  then exponentialIn power start (end / 2.0) (progress * 2.0)
  else exponentialOut power ((start + end) / 2.0) end (2.0 * progress - 1.0)
