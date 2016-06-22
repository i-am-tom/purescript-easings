module Test.Main where

import Prelude
import Math as M

import Main
  ( circular
  , exponential
  , inAndOut
  , out
  , polynomial
  , sine
  )

import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert

-- Truncate float noise.
round :: Number -> Number
round = (flip (/) $ 1000000.0)
  <<< M.round <<< (*) 1000000.0

main = runTest do
  suite "easings" do
    test "polynomial" do
      Assert.equal 0.0 <<< round $ polynomial 2.0 0.0 1.0 0.0
      Assert.equal 0.01 <<< round $ polynomial 2.0 0.0 1.0 0.1
      Assert.equal 0.04 <<< round $ polynomial 2.0 0.0 1.0 0.2
      Assert.equal 0.09 <<< round $ polynomial 2.0 0.0 1.0 0.3
      Assert.equal 0.16 <<< round $ polynomial 2.0 0.0 1.0 0.4
      Assert.equal 0.25 <<< round $ polynomial 2.0 0.0 1.0 0.5
      Assert.equal 0.36 <<< round $ polynomial 2.0 0.0 1.0 0.6
      Assert.equal 0.49 <<< round $ polynomial 2.0 0.0 1.0 0.7
      Assert.equal 0.64 <<< round $ polynomial 2.0 0.0 1.0 0.8
      Assert.equal 0.81 <<< round $ polynomial 2.0 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ polynomial 2.0 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ polynomial 3.0 0.0 1.0 0.0
      Assert.equal 0.001 <<< round $ polynomial 3.0 0.0 1.0 0.1
      Assert.equal 0.008 <<< round $ polynomial 3.0 0.0 1.0 0.2
      Assert.equal 0.027 <<< round $ polynomial 3.0 0.0 1.0 0.3
      Assert.equal 0.064 <<< round $ polynomial 3.0 0.0 1.0 0.4
      Assert.equal 0.125 <<< round $ polynomial 3.0 0.0 1.0 0.5
      Assert.equal 0.216 <<< round $ polynomial 3.0 0.0 1.0 0.6
      Assert.equal 0.343 <<< round $ polynomial 3.0 0.0 1.0 0.7
      Assert.equal 0.512 <<< round $ polynomial 3.0 0.0 1.0 0.8
      Assert.equal 0.729 <<< round $ polynomial 3.0 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ polynomial 3.0 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ polynomial 4.0 0.0 1.0 0.0
      Assert.equal 0.0001 <<< round $ polynomial 4.0 0.0 1.0 0.1
      Assert.equal 0.0016 <<< round $ polynomial 4.0 0.0 1.0 0.2
      Assert.equal 0.0081 <<< round $ polynomial 4.0 0.0 1.0 0.3
      Assert.equal 0.0256 <<< round $ polynomial 4.0 0.0 1.0 0.4
      Assert.equal 0.0625 <<< round $ polynomial 4.0 0.0 1.0 0.5
      Assert.equal 0.1296 <<< round $ polynomial 4.0 0.0 1.0 0.6
      Assert.equal 0.2401 <<< round $ polynomial 4.0 0.0 1.0 0.7
      Assert.equal 0.4096 <<< round $ polynomial 4.0 0.0 1.0 0.8
      Assert.equal 0.6561 <<< round $ polynomial 4.0 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ polynomial 4.0 0.0 1.0 1.0

    test "inverse" do
      Assert.equal 0.0 <<< round $ out (polynomial 2.0) 0.0 1.0 0.0
      Assert.equal 0.19 <<< round $ out (polynomial 2.0) 0.0 1.0 0.1
      Assert.equal 0.36 <<< round $ out (polynomial 2.0) 0.0 1.0 0.2
      Assert.equal 0.51 <<< round $ out (polynomial 2.0) 0.0 1.0 0.3
      Assert.equal 0.64 <<< round $ out (polynomial 2.0) 0.0 1.0 0.4
      Assert.equal 0.75 <<< round $ out (polynomial 2.0) 0.0 1.0 0.5
      Assert.equal 0.84 <<< round $ out (polynomial 2.0) 0.0 1.0 0.6
      Assert.equal 0.91 <<< round $ out (polynomial 2.0) 0.0 1.0 0.7
      Assert.equal 0.96 <<< round $ out (polynomial 2.0) 0.0 1.0 0.8
      Assert.equal 0.99 <<< round $ out (polynomial 2.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ out (polynomial 2.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ out (polynomial 3.0) 0.0 1.0 0.0
      Assert.equal 0.271 <<< round $ out (polynomial 3.0) 0.0 1.0 0.1
      Assert.equal 0.488 <<< round $ out (polynomial 3.0) 0.0 1.0 0.2
      Assert.equal 0.657 <<< round $ out (polynomial 3.0) 0.0 1.0 0.3
      Assert.equal 0.784 <<< round $ out (polynomial 3.0) 0.0 1.0 0.4
      Assert.equal 0.875 <<< round $ out (polynomial 3.0) 0.0 1.0 0.5
      Assert.equal 0.936 <<< round $ out (polynomial 3.0) 0.0 1.0 0.6
      Assert.equal 0.973 <<< round $ out (polynomial 3.0) 0.0 1.0 0.7
      Assert.equal 0.992 <<< round $ out (polynomial 3.0) 0.0 1.0 0.8
      Assert.equal 0.999 <<< round $ out (polynomial 3.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ out (polynomial 3.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ out (polynomial 4.0) 0.0 1.0 0.0
      Assert.equal 0.3439 <<< round $ out (polynomial 4.0) 0.0 1.0 0.1
      Assert.equal 0.5904 <<< round $ out (polynomial 4.0) 0.0 1.0 0.2
      Assert.equal 0.7599 <<< round $ out (polynomial 4.0) 0.0 1.0 0.3
      Assert.equal 0.8704 <<< round $ out (polynomial 4.0) 0.0 1.0 0.4
      Assert.equal 0.9375 <<< round $ out (polynomial 4.0) 0.0 1.0 0.5
      Assert.equal 0.9744 <<< round $ out (polynomial 4.0) 0.0 1.0 0.6
      Assert.equal 0.9919 <<< round $ out (polynomial 4.0) 0.0 1.0 0.7
      Assert.equal 0.9984 <<< round $ out (polynomial 4.0) 0.0 1.0 0.8
      Assert.equal 0.9999 <<< round $ out (polynomial 4.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ out (polynomial 4.0) 0.0 1.0 1.0

    test "symmetric" do
      Assert.equal 0.0 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.0
      Assert.equal 0.02 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.1
      Assert.equal 0.08 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.2
      Assert.equal 0.18 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.3
      Assert.equal 0.32 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.4
      Assert.equal 0.5 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.5
      Assert.equal 0.68 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.6
      Assert.equal 0.82 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.7
      Assert.equal 0.92 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.8
      Assert.equal 0.98 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ inAndOut (polynomial 2.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.0
      Assert.equal 0.004 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.1
      Assert.equal 0.032 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.2
      Assert.equal 0.108 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.3
      Assert.equal 0.256 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.4
      Assert.equal 0.5 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.5
      Assert.equal 0.744 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.6
      Assert.equal 0.892 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.7
      Assert.equal 0.968 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.8
      Assert.equal 0.996 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ inAndOut (polynomial 3.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.0
      Assert.equal 0.0008 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.1
      Assert.equal 0.0128 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.2
      Assert.equal 0.0648 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.3
      Assert.equal 0.2048 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.4
      Assert.equal 0.5 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.5
      Assert.equal 0.7952 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.6
      Assert.equal 0.9352 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.7
      Assert.equal 0.9872 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.8
      Assert.equal 0.9992 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ inAndOut (polynomial 4.0) 0.0 1.0 1.0

    test "sinusoidal" do
      Assert.equal 0.0 <<< round $ sine 0.0 1.0 0.0
      Assert.equal 0.012312 <<< round $ sine 0.0 1.0 0.1
      Assert.equal 0.048943 <<< round $ sine 0.0 1.0 0.2
      Assert.equal 0.108993 <<< round $ sine 0.0 1.0 0.3
      Assert.equal 0.190983 <<< round $ sine 0.0 1.0 0.4
      Assert.equal 0.292893 <<< round $ sine 0.0 1.0 0.5
      Assert.equal 0.412215 <<< round $ sine 0.0 1.0 0.6
      Assert.equal 0.54601 <<< round $ sine 0.0 1.0 0.7
      Assert.equal 0.690983 <<< round $ sine 0.0 1.0 0.8
      Assert.equal 0.843566 <<< round $ sine 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ sine 0.0 1.0 1.0

    test "exponential" do
      Assert.equal 0.0 <<< round $ exponential 0.0 1.0 0.0
      Assert.equal 0.001953 <<< round $ exponential 0.0 1.0 0.1
      Assert.equal 0.003906 <<< round $ exponential 0.0 1.0 0.2
      Assert.equal 0.007813 <<< round $ exponential 0.0 1.0 0.3
      Assert.equal 0.015625 <<< round $ exponential 0.0 1.0 0.4
      Assert.equal 0.03125 <<< round $ exponential 0.0 1.0 0.5
      Assert.equal 0.0625 <<< round $ exponential 0.0 1.0 0.6
      Assert.equal 0.125 <<< round $ exponential 0.0 1.0 0.7
      Assert.equal 0.25 <<< round $ exponential 0.0 1.0 0.8
      Assert.equal 0.5 <<< round $ exponential 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ exponential 0.0 1.0 1.0

    test "circular" do
      Assert.equal 0.0 <<< round $ circular 0.0 1.0 0.0
      Assert.equal 0.005013 <<< round $ circular 0.0 1.0 0.1
      Assert.equal 0.020204 <<< round $ circular 0.0 1.0 0.2
      Assert.equal 0.046061 <<< round $ circular 0.0 1.0 0.3
      Assert.equal 0.083485 <<< round $ circular 0.0 1.0 0.4
      Assert.equal 0.133975 <<< round $ circular 0.0 1.0 0.5
      Assert.equal 0.2 <<< round $ circular 0.0 1.0 0.6
      Assert.equal 0.285857 <<< round $ circular 0.0 1.0 0.7
      Assert.equal 0.4 <<< round $ circular 0.0 1.0 0.8
      Assert.equal 0.564110 <<< round $ circular 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ circular 0.0 1.0 1.0
