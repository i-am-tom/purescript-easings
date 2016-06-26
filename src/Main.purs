module Main where

import Prelude
import Math (abs, cos, pi, pow, sin, sqrt)

type Easing = Number -> Number -> Number -> Number

infix 9 pow as ^

out :: Easing -> Easing
out f start end progress = f end start (1.0 - progress)

inAndOut :: Easing -> Easing
inAndOut f start end progress
  | progress < 0.5 = f start (end / 2.0) (progress * 2.0)
  | otherwise      = (out f) ((start + end) / 2.0) end (2.0 * progress - 1.0)

-- Polynomial easing.
polynomial :: Number -> Easing
polynomial power start end progress =
  progress ^ power * (end - start) + start

-- Sinusoidal easing.
sine :: Easing
sine start end = (+) end
  <<< (*) (start - end)
  <<< cos <<< (*) (pi / 2.0)

-- Exponential easing.
exponential :: Easing
exponential start end 0.0 = start
exponential start end progress = start + (end - start) * 2.0 ^ (10.0 * (progress - 1.0))

-- Circular easing.
circular :: Easing
circular start end = (+) start
  <<< (*) (start - end)
  <<< \x -> (sqrt $ 1.0 - x ^ 2.0) - 1.0

-- Elastic easing.
elastic :: Easing
elastic start _ 0.0 = start
elastic _ end 1.0 = end
elastic start end progress =
  (start - end) * 2.0 ^ (10.0 * (progress - 1.0))
    * (sin $ pi * (2.0 * progress - 1.85) / 0.15)

-- Back easing.
back :: Easing
back start end progress = start + (end - start)
  * progress ^ 2.0 * (2.70158 * progress - 1.70158)

-- Bounce easing.
bounce :: Easing
bounce start end progress
  | progress < 1.0 / 2.75 = start + (end - start) * 7.5625 * progress ^ 2.0
  | progress < 2.0 / 2.75 = start + (end - start) * (7.5625 * (progress - 1.5 / 2.75) ^ 2.0 + 0.75)
	| progress < 2.5 / 2.75 = start + (end - start) * (7.5625 * (progress - 2.25 / 2.75) ^ 2.0 + 0.9375)
	| otherwise = start + (end - start) * (7.5625 * (progress - 2.625 / 2.75) ^ 2.0 + 0.984375)
