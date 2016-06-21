module Test.Main where

import Prelude
import Main (sine, out, exponential, inAndOut)
import Math as M

import Test.Unit (suite, test)
import Test.Unit.Main (runTest)
import Test.Unit.Assert as Assert

-- Truncate float noise.
round :: Number -> Number
round = (flip (/) $ 1000000.0)
  <<< M.round <<< (*) 1000000.0

main = runTest do
  suite "easings" do
    test "exponential" do
      Assert.equal 0.0 <<< round $ exponential 2.0 0.0 1.0 0.0
      Assert.equal 0.01 <<< round $ exponential 2.0 0.0 1.0 0.1
      Assert.equal 0.04 <<< round $ exponential 2.0 0.0 1.0 0.2
      Assert.equal 0.09 <<< round $ exponential 2.0 0.0 1.0 0.3
      Assert.equal 0.16 <<< round $ exponential 2.0 0.0 1.0 0.4
      Assert.equal 0.25 <<< round $ exponential 2.0 0.0 1.0 0.5
      Assert.equal 0.36 <<< round $ exponential 2.0 0.0 1.0 0.6
      Assert.equal 0.49 <<< round $ exponential 2.0 0.0 1.0 0.7
      Assert.equal 0.64 <<< round $ exponential 2.0 0.0 1.0 0.8
      Assert.equal 0.81 <<< round $ exponential 2.0 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ exponential 2.0 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ exponential 3.0 0.0 1.0 0.0
      Assert.equal 0.001 <<< round $ exponential 3.0 0.0 1.0 0.1
      Assert.equal 0.008 <<< round $ exponential 3.0 0.0 1.0 0.2
      Assert.equal 0.027 <<< round $ exponential 3.0 0.0 1.0 0.3
      Assert.equal 0.064 <<< round $ exponential 3.0 0.0 1.0 0.4
      Assert.equal 0.125 <<< round $ exponential 3.0 0.0 1.0 0.5
      Assert.equal 0.216 <<< round $ exponential 3.0 0.0 1.0 0.6
      Assert.equal 0.343 <<< round $ exponential 3.0 0.0 1.0 0.7
      Assert.equal 0.512 <<< round $ exponential 3.0 0.0 1.0 0.8
      Assert.equal 0.729 <<< round $ exponential 3.0 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ exponential 3.0 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ exponential 4.0 0.0 1.0 0.0
      Assert.equal 0.0001 <<< round $ exponential 4.0 0.0 1.0 0.1
      Assert.equal 0.0016 <<< round $ exponential 4.0 0.0 1.0 0.2
      Assert.equal 0.0081 <<< round $ exponential 4.0 0.0 1.0 0.3
      Assert.equal 0.0256 <<< round $ exponential 4.0 0.0 1.0 0.4
      Assert.equal 0.0625 <<< round $ exponential 4.0 0.0 1.0 0.5
      Assert.equal 0.1296 <<< round $ exponential 4.0 0.0 1.0 0.6
      Assert.equal 0.2401 <<< round $ exponential 4.0 0.0 1.0 0.7
      Assert.equal 0.4096 <<< round $ exponential 4.0 0.0 1.0 0.8
      Assert.equal 0.6561 <<< round $ exponential 4.0 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ exponential 4.0 0.0 1.0 1.0

    test "inverse exponential" do
      Assert.equal 0.0 <<< round $ out (exponential 2.0) 0.0 1.0 0.0
      Assert.equal 0.19 <<< round $ out (exponential 2.0) 0.0 1.0 0.1
      Assert.equal 0.36 <<< round $ out (exponential 2.0) 0.0 1.0 0.2
      Assert.equal 0.51 <<< round $ out (exponential 2.0) 0.0 1.0 0.3
      Assert.equal 0.64 <<< round $ out (exponential 2.0) 0.0 1.0 0.4
      Assert.equal 0.75 <<< round $ out (exponential 2.0) 0.0 1.0 0.5
      Assert.equal 0.84 <<< round $ out (exponential 2.0) 0.0 1.0 0.6
      Assert.equal 0.91 <<< round $ out (exponential 2.0) 0.0 1.0 0.7
      Assert.equal 0.96 <<< round $ out (exponential 2.0) 0.0 1.0 0.8
      Assert.equal 0.99 <<< round $ out (exponential 2.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ out (exponential 2.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ out (exponential 3.0) 0.0 1.0 0.0
      Assert.equal 0.271 <<< round $ out (exponential 3.0) 0.0 1.0 0.1
      Assert.equal 0.488 <<< round $ out (exponential 3.0) 0.0 1.0 0.2
      Assert.equal 0.657 <<< round $ out (exponential 3.0) 0.0 1.0 0.3
      Assert.equal 0.784 <<< round $ out (exponential 3.0) 0.0 1.0 0.4
      Assert.equal 0.875 <<< round $ out (exponential 3.0) 0.0 1.0 0.5
      Assert.equal 0.936 <<< round $ out (exponential 3.0) 0.0 1.0 0.6
      Assert.equal 0.973 <<< round $ out (exponential 3.0) 0.0 1.0 0.7
      Assert.equal 0.992 <<< round $ out (exponential 3.0) 0.0 1.0 0.8
      Assert.equal 0.999 <<< round $ out (exponential 3.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ out (exponential 3.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ out (exponential 4.0) 0.0 1.0 0.0
      Assert.equal 0.3439 <<< round $ out (exponential 4.0) 0.0 1.0 0.1
      Assert.equal 0.5904 <<< round $ out (exponential 4.0) 0.0 1.0 0.2
      Assert.equal 0.7599 <<< round $ out (exponential 4.0) 0.0 1.0 0.3
      Assert.equal 0.8704 <<< round $ out (exponential 4.0) 0.0 1.0 0.4
      Assert.equal 0.9375 <<< round $ out (exponential 4.0) 0.0 1.0 0.5
      Assert.equal 0.9744 <<< round $ out (exponential 4.0) 0.0 1.0 0.6
      Assert.equal 0.9919 <<< round $ out (exponential 4.0) 0.0 1.0 0.7
      Assert.equal 0.9984 <<< round $ out (exponential 4.0) 0.0 1.0 0.8
      Assert.equal 0.9999 <<< round $ out (exponential 4.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ out (exponential 4.0) 0.0 1.0 1.0

    test "symmetric exponential" do
      Assert.equal 0.0 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.0
      Assert.equal 0.02 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.1
      Assert.equal 0.08 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.2
      Assert.equal 0.18 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.3
      Assert.equal 0.32 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.4
      Assert.equal 0.5 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.5
      Assert.equal 0.68 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.6
      Assert.equal 0.82 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.7
      Assert.equal 0.92 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.8
      Assert.equal 0.98 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ inAndOut (exponential 2.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.0
      Assert.equal 0.004 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.1
      Assert.equal 0.032 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.2
      Assert.equal 0.108 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.3
      Assert.equal 0.256 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.4
      Assert.equal 0.5 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.5
      Assert.equal 0.744 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.6
      Assert.equal 0.892 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.7
      Assert.equal 0.968 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.8
      Assert.equal 0.996 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ inAndOut (exponential 3.0) 0.0 1.0 1.0
      Assert.equal 0.0 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.0
      Assert.equal 0.0008 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.1
      Assert.equal 0.0128 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.2
      Assert.equal 0.0648 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.3
      Assert.equal 0.2048 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.4
      Assert.equal 0.5 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.5
      Assert.equal 0.7952 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.6
      Assert.equal 0.9352 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.7
      Assert.equal 0.9872 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.8
      Assert.equal 0.9992 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ inAndOut (exponential 4.0) 0.0 1.0 1.0

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

    test "inverse sinusoidal" do
      Assert.equal 0.0 <<< round $ (out sine) 0.0 1.0 0.0
      Assert.equal 0.156434 <<< round $ (out sine) 0.0 1.0 0.1
      Assert.equal 0.309017 <<< round $ (out sine) 0.0 1.0 0.2
      Assert.equal 0.453990 <<< round $ (out sine) 0.0 1.0 0.3
      Assert.equal 0.587785 <<< round $ (out sine) 0.0 1.0 0.4
      Assert.equal 0.707107 <<< round $ (out sine) 0.0 1.0 0.5
      Assert.equal 0.809017 <<< round $ (out sine) 0.0 1.0 0.6
      Assert.equal 0.891007 <<< round $ (out sine) 0.0 1.0 0.7
      Assert.equal 0.951057 <<< round $ (out sine) 0.0 1.0 0.8
      Assert.equal 0.987688 <<< round $ (out sine) 0.0 1.0 0.9
      Assert.equal 1.0 <<< round $ (out sine) 0.0 1.0 1.0

    test "symmetric sinusoidal" do
      Assert.equal 0.0      <<< round $ (inAndOut sine) 0.0 1.0 0.0
      Assert.equal 0.024472 <<< round $ (inAndOut sine) 0.0 1.0 0.1
      Assert.equal 0.095492 <<< round $ (inAndOut sine) 0.0 1.0 0.2
      Assert.equal 0.206107 <<< round $ (inAndOut sine) 0.0 1.0 0.3
      Assert.equal 0.345492 <<< round $ (inAndOut sine) 0.0 1.0 0.4
      Assert.equal 0.5      <<< round $ (inAndOut sine) 0.0 1.0 0.5
      Assert.equal 0.654508 <<< round $ (inAndOut sine) 0.0 1.0 0.6
      Assert.equal 0.793893 <<< round $ (inAndOut sine) 0.0 1.0 0.7
      Assert.equal 0.904508 <<< round $ (inAndOut sine) 0.0 1.0 0.8
      Assert.equal 0.975528 <<< round $ (inAndOut sine) 0.0 1.0 0.9
      Assert.equal 1.0      <<< round $ (inAndOut sine) 0.0 1.0 1.0
