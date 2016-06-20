module Main where

import Prelude
import Math

type Start    = Number
type End      = Number
type Progress = Number

type Easing = Start -> End -> Progress -> Number

linear :: Easing
linear start end = (+) start <<< (*) (end - start)

-- Quadratic easings.

quadIn :: Easing
quadIn start end = (+) start
  <<< (*) (end - start)
  <<< (flip pow $ 2.0)

quadOut :: Easing
quadOut start end progress = start + (start - end) * progress * (progress - 2.0)

quadBoth :: Easing
quadBoth start end progress = if adjusted < 1.0
    then start + (end - start) / 2.0 * (pow adjusted 2.0)
    else start + (start - end) / 2.0 * ((pow (adjusted - 2.0) 2.0) - 2.0)
  where adjusted = progress * 2.0

-- Cubic easings.

cubicIn :: Easing
cubicIn start end = (+) start
  <<< (*) (end - start)
  <<< (flip pow $ 3.0)

cubicOut :: Easing
cubicOut start end progress = start + (end - start) * ((pow adjusted 3.0) + 1.0)
  where adjusted = progress - 1.0

cubicBoth :: Easing
cubicBoth start end progress = if inAdjusted < 1.0
    then start + (end - start) / 2.0 * (pow inAdjusted 3.0)
    else start + (end - start) / 2.0 * ((pow outAdjusted 3.0) + 2.0)
  where inAdjusted  = progress * 2.0
        outAdjusted = inAdjusted - 2.0

-- Quartic easings.

quarticIn :: Easing
quarticIn start end = (+) start
  <<< (*) (end - start)
  <<< (flip pow $ 4.0)

quarticOut :: Easing
quarticOut start end = (+) start
  <<< (*) (start - end)
  <<< (flip (-) $ 1.0)
  <<< (flip pow $ 4.0)
  <<< (flip (-) $ 1.0)

quarticBoth :: Easing
quarticBoth start end progress = if inAdjusted < 1.0
    then start + (end - start) / 2.0 * (pow inAdjusted 4.0)
    else start + (start - end) / 2.0 * ((pow outAdjusted 4.0) - 2.0)
  where inAdjusted  = progress * 2.0
        outAdjusted = inAdjusted - 2.0
