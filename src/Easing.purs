module Easing
  ( Easing

  , out
  , inAndOut

  , polynomial
  , sine
  , exponential
  , circular
  , elastic
  , back
  , bounce
  ) where

import Prelude
import Math (cos, pi, pow, sin, sqrt)

-- | The `Easing` type is just to make the code a bit easier to read.
-- | We can call the three inputs, "start", "end", and "progress",
-- | respectively. The "progress" is a number (usually) between 0 and
-- | 1, indicating how far through the animation we are (0 being the
-- | start, and 1 being the end). The "start" and "end" values are the
-- | actual values between which we're easing. The result is simply
-- | what the value would be at that point in the progress!
type Easing = Number -> Number -> Number -> Number

infixl 9 pow as ^

-- | All the easings "ease in". For example, the elastic easing will
-- | be elastic around the _end_ of the animation, rather than the
-- | beginning. Sometimes, however, you want the opposite. Well, as
-- | luck would have it, we have the function for you! Simply, this
-- | flips the inputs and progress for an easing function, so you can
-- | use `out circular` just as you'd use `circular`.
out :: Easing -> Easing
out f start end progress = f end start (1.0 - progress)

-- | With all these in and out escapades, you might find yourself with
-- | a longing - a _yearning_ - for symmetry. Be afflicted no more:
-- | `inAndOut` will take a function, and mirror it, such that it will
-- | ease in and out in exactly the same way.
inAndOut :: Easing -> Easing
inAndOut f start end progress
  | progress < 0.5 = f start (end / 2.0) (progress * 2.0)
  | otherwise      = (out f) ((start + end) / 2.0) end (2.0 * progress - 1.0)

-- | Polynomial easing. `polynomial 1` is your run-of-the-mill linear
-- | easing, start-to-end moving at a constant speed, yawn. However,
-- | the 1 can be replaced with other numbers, and that value will be
-- | the power to which `progress` is lifted. As it goes up, entry and
-- | exit will become steeper. Somewhere between 1 and 5 is usually
-- | pretty good.
polynomial :: Number -> Easing
polynomial power start end progress =
  progress ^ power * (end - start) + start

-- | Sinusoidal easing. This is an easing that follows a sinusoidal
-- | curve from `start` to `end`, starting fast and ending slow. Bit
-- | of trivia: internally, it uses `cos`, not `sin`. Pranked ya!
sine :: Easing
sine start end progress = end + (start - end) * delta
  where delta = cos $ progress * (pi / 2.0)

-- | Exponential easing. This is an easing whose speed follows the
-- | exponential curve: it starts very slow, and ends very fast.
exponential :: Easing
exponential start end 0.0      = start
exponential start end progress = start + (end - start) * delta
  where delta = 2.0 ^ (10.0 * (progress - 1.0))

-- | Circular easing. Why settle for things like sinusoidal easing
-- | when you can follow the exact edge of a circle? Look, reader: I
-- | ported this library from a jQuery plugin. I didn't get to make
-- | any decisions about its content.
circular :: Easing
circular start end progress = start + (start - end) * delta
  where delta = (sqrt $ 1.0 - progress ^ 2.0) - 1.0

-- | Elastic easing. This is the sexy animation that everyone wants to
-- | see on your Web2.0 startup page. The animation quickly moves
-- | _beyond_ the final value, and then elastically bounces back to
-- | the value you actually wanted. Watch your investors *swoon*.
elastic :: Easing
elastic start _ 0.0 = start
elastic _ end 1.0 = end
elastic start end progress =
  (start - end) * 2.0 ^ (10.0 * (progress - 1.0))
    * (sin $ pi * (2.0 * progress - 1.85) / 0.15)

-- | Back easing. I'd have called this one "run-up": we move slightly
-- | backwards from the start, then charge forward to the end, with a
-- | little pinch of acceleration for good measure. Think about blinds
-- | in cartoons.
back :: Easing
back start end progress = start + (end - start)
  * progress ^ 2.0 * (2.70158 * progress - 1.70158)

-- | Imagine your "end" value is a solid wall. This basically looks
-- | like `elastic`, except it "bounces" off the end value instead of
-- | going over it. Imagine dropping an `h1` from 200px high onto a
-- | tarmac floor (remembering that `h1`s are quite rubbery). That's
-- | what you get with `bounce -200.0 0`. This isn't the prettiest of
-- | implementations, so maybe just don't look at it for too long.
bounce :: Easing
bounce start end progress
  | progress < 1.0 / 2.75 = start + (end - start)
                          * 7.5625 * progress ^ 2.0

  | progress < 2.0 / 2.75 = start + (end - start)
                          * (7.5625 * (progress - 1.5 / 2.75) ^ 2.0 + 0.75)

  | progress < 2.5 / 2.75 = start + (end - start)
                          * (7.5625 * (progress - 2.25 / 2.75) ^ 2.0 + 0.9375)

  | otherwise = start + (end - start)
              * (7.5625 * (progress - 2.625 / 2.75) ^ 2.0 + 0.984375)
