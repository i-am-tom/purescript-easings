module Main where

import Prelude
import Math

type Start    = Number
type End      = Number
type Progress = Number

type Easing = Start -> End -> Progress -> Number

infix 9 pow as ^

-- Plain, linear easing.

linear :: Easing
linear start end = (+) start
  <<< (*) (end - start)

-- Quadratic easings.

quadIn :: Easing
quadIn start end = (+) start
  <<< (*) (end - start)
  <<< (flip pow $ 2.0)

quadOut :: Easing
quadOut start end = (+) start
  <<< (*) (start - end)
  <<< \p -> p * (p - 2.0)

quadBoth :: Easing
quadBoth start end progress =
  start + (end - start) * if progress < 0.5
    then 2.0 * progress ^ 2.0
    else 1.0 - 2.0 * (progress - 1.0) ^ 2.0

-- Cubic easings.

cubicIn :: Easing
cubicIn start end = (+) start
  <<< (*) (end - start)
  <<< (flip pow $ 3.0)

cubicOut :: Easing
cubicOut start end = (+) start
  <<< (*) (end - start)
  <<< \p -> (p - 1.0) ^ 3.0 + 1.0

cubicBoth :: Easing
cubicBoth start end progress =
  start + (end - start) / 2.0 * if progress < 0.5
    then (progress * 2.0) ^ 3.0
    else (progress * 2.0 - 2.0) ^ 3.0 + 2.0

-- Quartic easings.

quarticIn :: Easing
quarticIn start end = (+) start
  <<< (*) (end - start)
  <<< (flip pow $ 4.0)

quarticOut :: Easing
quarticOut start end = (+) start
  <<< (*) (start - end)
  <<< \p -> (p - 1.0) ^ 4.0 - 1.0

quarticBoth :: Easing
quarticBoth start end progress =
  start + (end - start) / 2.0 * if progress < 0.5
    then (progress * 2.0) ^ 4.0
    else 2.0 - (progress * 2.0 - 2.0) ^ 4.0
