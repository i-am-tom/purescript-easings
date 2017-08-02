module Test.Main where

import Prelude
import Easing
import Data.Array ((..), (!!))
import Data.Int (toNumber)
import Data.Maybe (fromMaybe)
import Data.Traversable (for)
import Math as M
import Test.Unit.Assert as Assert
import Test.Unit (suite, test)
import Test.Unit.Main (runTest)

-- Truncate float noise.
round x = (M.round $ x * p) / p
  where p = 1000000.0

-- Check an easing against a list of expected values.
check easing values = void $ for (0 .. 10) \n ->
  let expected = fromMaybe 0.0 $ (values !! n)
      actual = easing 0.0 1.0 (toNumber n / 10.0)
  in Assert.equal expected $ round actual

main = runTest do
  suite "easings" do
    test "polynomial" do
      -- Cubic
      check (polynomial 3.0) [ 0.0,   0.001, 0.008, 0.027
                             , 0.064, 0.125, 0.216, 0.343
                             , 0.512, 0.729, 1.0 ]

      -- Quartic
      check (polynomial 4.0) [ 0.0,    0.0001, 0.0016, 0.0081
                             , 0.0256, 0.0625, 0.1296, 0.2401
                             , 0.4096, 0.6561, 1.0 ]

    test "inverse" do
      -- Out quadratic
      check (out $ polynomial 2.0) [ 0.0,  0.19, 0.36, 0.51
                                   , 0.64, 0.75, 0.84, 0.91
                                   , 0.96, 0.99, 1.0 ]


      -- Out cubic
      check (out $ polynomial 3.0) [ 0.0,   0.271, 0.488, 0.657
                                   , 0.784, 0.875, 0.936, 0.973
                                   , 0.992, 0.999, 1.0 ]

      -- Out quartic
      check (out $ polynomial 4.0) [ 0.0,    0.3439, 0.5904, 0.7599
                                   , 0.8704, 0.9375, 0.9744, 0.9919
                                   , 0.9984, 0.9999, 1.0 ]

    test "symmetric" do
      -- In-and-out quadratic
      check (inAndOut $ polynomial 2.0) [ 0.0, 0.02, 0.08, 0.18
                                        , 0.32, 0.5, 0.68, 0.82
                                        , 0.92, 0.98, 1.0 ]

      check (inAndOut $ polynomial 3.0) [ 0.0,   0.004, 0.032, 0.108
                                        , 0.256, 0.5,   0.744, 0.892
                                        , 0.968, 0.996, 1.0 ]

      check (inAndOut $ polynomial 4.0) [ 0.0,    0.0008, 0.0128, 0.0648
                                        , 0.2048, 0.5,    0.7952, 0.9352
                                        , 0.9872, 0.9992, 1.0 ]

    test "sinusoidal" do
      check sine [ 0.0,      0.012312, 0.048943, 0.108993
                 , 0.190983, 0.292893, 0.412215, 0.54601
                 , 0.690983, 0.843566, 1.0 ]

    test "exponential" do
      check exponential [ 0.0,      0.001953, 0.003906, 0.007813
                        , 0.015625, 0.03125,  0.0625,   0.125
                        , 0.25, 0.5, 1.0 ]

    test "circular" do
      check circular [ 0.0,      0.005013, 0.020204, 0.046061
                     , 0.083485, 0.133975, 0.2,      0.285857
                     , 0.4, 0.564110, 1.0 ]

    test "elastic" do
      check elastic [   0.0,         0.0,       (-0.003383), 0.006766
                    ,   0.0,       (-0.027063),   0.054127,  0.0
                    , (-0.216506),   0.433013,    1.0 ]

    test "back" do
      check back [   0.0,       (-0.014314), (-0.046451), (-0.0802)
                 , (-0.099352), (-0.087698), (-0.029028),   0.092868
                 ,   0.294198,    0.591172,    1.0 ]

    test "bounce" do
      check bounce [ 0.0,  0.075625, 0.3025, 0.680625
                   , 0.91, 0.765625, 0.7725, 0.930625
                   , 0.94, 0.988125, 1.0 ]
