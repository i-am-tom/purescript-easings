module Test.Main where

import Prelude
import Main
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
    test "exponentialIn" do
      Assert.equal 0.0    <<< round $ exponentialIn 2.0 0.0 1.0 0.0
      Assert.equal 0.01   <<< round $ exponentialIn 2.0 0.0 1.0 0.1
      Assert.equal 0.04   <<< round $ exponentialIn 2.0 0.0 1.0 0.2
      Assert.equal 0.09   <<< round $ exponentialIn 2.0 0.0 1.0 0.3
      Assert.equal 0.16   <<< round $ exponentialIn 2.0 0.0 1.0 0.4
      Assert.equal 0.25   <<< round $ exponentialIn 2.0 0.0 1.0 0.5
      Assert.equal 0.36   <<< round $ exponentialIn 2.0 0.0 1.0 0.6
      Assert.equal 0.49   <<< round $ exponentialIn 2.0 0.0 1.0 0.7
      Assert.equal 0.64   <<< round $ exponentialIn 2.0 0.0 1.0 0.8
      Assert.equal 0.81   <<< round $ exponentialIn 2.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialIn 2.0 0.0 1.0 1.0
      Assert.equal 0.0    <<< round $ exponentialIn 3.0 0.0 1.0 0.0
      Assert.equal 0.001  <<< round $ exponentialIn 3.0 0.0 1.0 0.1
      Assert.equal 0.008  <<< round $ exponentialIn 3.0 0.0 1.0 0.2
      Assert.equal 0.027  <<< round $ exponentialIn 3.0 0.0 1.0 0.3
      Assert.equal 0.064  <<< round $ exponentialIn 3.0 0.0 1.0 0.4
      Assert.equal 0.125  <<< round $ exponentialIn 3.0 0.0 1.0 0.5
      Assert.equal 0.216  <<< round $ exponentialIn 3.0 0.0 1.0 0.6
      Assert.equal 0.343  <<< round $ exponentialIn 3.0 0.0 1.0 0.7
      Assert.equal 0.512  <<< round $ exponentialIn 3.0 0.0 1.0 0.8
      Assert.equal 0.729  <<< round $ exponentialIn 3.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialIn 3.0 0.0 1.0 1.0
      Assert.equal 0.0    <<< round $ exponentialIn 4.0 0.0 1.0 0.0
      Assert.equal 0.0001 <<< round $ exponentialIn 4.0 0.0 1.0 0.1
      Assert.equal 0.0016 <<< round $ exponentialIn 4.0 0.0 1.0 0.2
      Assert.equal 0.0081 <<< round $ exponentialIn 4.0 0.0 1.0 0.3
      Assert.equal 0.0256 <<< round $ exponentialIn 4.0 0.0 1.0 0.4
      Assert.equal 0.0625 <<< round $ exponentialIn 4.0 0.0 1.0 0.5
      Assert.equal 0.1296 <<< round $ exponentialIn 4.0 0.0 1.0 0.6
      Assert.equal 0.2401 <<< round $ exponentialIn 4.0 0.0 1.0 0.7
      Assert.equal 0.4096 <<< round $ exponentialIn 4.0 0.0 1.0 0.8
      Assert.equal 0.6561 <<< round $ exponentialIn 4.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialIn 4.0 0.0 1.0 1.0

    test "exponentialOut" do
      Assert.equal 0.0    <<< round $ exponentialOut 2.0 0.0 1.0 0.0
      Assert.equal 0.19   <<< round $ exponentialOut 2.0 0.0 1.0 0.1
      Assert.equal 0.36   <<< round $ exponentialOut 2.0 0.0 1.0 0.2
      Assert.equal 0.51   <<< round $ exponentialOut 2.0 0.0 1.0 0.3
      Assert.equal 0.64   <<< round $ exponentialOut 2.0 0.0 1.0 0.4
      Assert.equal 0.75   <<< round $ exponentialOut 2.0 0.0 1.0 0.5
      Assert.equal 0.84   <<< round $ exponentialOut 2.0 0.0 1.0 0.6
      Assert.equal 0.91   <<< round $ exponentialOut 2.0 0.0 1.0 0.7
      Assert.equal 0.96   <<< round $ exponentialOut 2.0 0.0 1.0 0.8
      Assert.equal 0.99   <<< round $ exponentialOut 2.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialOut 2.0 0.0 1.0 1.0
      Assert.equal 0.0    <<< round $ exponentialOut 3.0 0.0 1.0 0.0
      Assert.equal 0.271  <<< round $ exponentialOut 3.0 0.0 1.0 0.1
      Assert.equal 0.488  <<< round $ exponentialOut 3.0 0.0 1.0 0.2
      Assert.equal 0.657  <<< round $ exponentialOut 3.0 0.0 1.0 0.3
      Assert.equal 0.784  <<< round $ exponentialOut 3.0 0.0 1.0 0.4
      Assert.equal 0.875  <<< round $ exponentialOut 3.0 0.0 1.0 0.5
      Assert.equal 0.936  <<< round $ exponentialOut 3.0 0.0 1.0 0.6
      Assert.equal 0.973  <<< round $ exponentialOut 3.0 0.0 1.0 0.7
      Assert.equal 0.992  <<< round $ exponentialOut 3.0 0.0 1.0 0.8
      Assert.equal 0.999  <<< round $ exponentialOut 3.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialOut 3.0 0.0 1.0 1.0
      Assert.equal 0.0    <<< round $ exponentialOut 4.0 0.0 1.0 0.0
      Assert.equal 0.3439 <<< round $ exponentialOut 4.0 0.0 1.0 0.1
      Assert.equal 0.5904 <<< round $ exponentialOut 4.0 0.0 1.0 0.2
      Assert.equal 0.7599 <<< round $ exponentialOut 4.0 0.0 1.0 0.3
      Assert.equal 0.8704 <<< round $ exponentialOut 4.0 0.0 1.0 0.4
      Assert.equal 0.9375 <<< round $ exponentialOut 4.0 0.0 1.0 0.5
      Assert.equal 0.9744 <<< round $ exponentialOut 4.0 0.0 1.0 0.6
      Assert.equal 0.9919 <<< round $ exponentialOut 4.0 0.0 1.0 0.7
      Assert.equal 0.9984 <<< round $ exponentialOut 4.0 0.0 1.0 0.8
      Assert.equal 0.9999 <<< round $ exponentialOut 4.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialOut 4.0 0.0 1.0 1.0

    test "exponentialBoth" do
      Assert.equal 0.0    <<< round $ exponentialBoth 2.0 0.0 1.0 0.0
      Assert.equal 0.02   <<< round $ exponentialBoth 2.0 0.0 1.0 0.1
      Assert.equal 0.08   <<< round $ exponentialBoth 2.0 0.0 1.0 0.2
      Assert.equal 0.18   <<< round $ exponentialBoth 2.0 0.0 1.0 0.3
      Assert.equal 0.32   <<< round $ exponentialBoth 2.0 0.0 1.0 0.4
      Assert.equal 0.5    <<< round $ exponentialBoth 2.0 0.0 1.0 0.5
      Assert.equal 0.68   <<< round $ exponentialBoth 2.0 0.0 1.0 0.6
      Assert.equal 0.82   <<< round $ exponentialBoth 2.0 0.0 1.0 0.7
      Assert.equal 0.92   <<< round $ exponentialBoth 2.0 0.0 1.0 0.8
      Assert.equal 0.98   <<< round $ exponentialBoth 2.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialBoth 2.0 0.0 1.0 1.0
      Assert.equal 0.0    <<< round $ exponentialBoth 3.0 0.0 1.0 0.0
      Assert.equal 0.004  <<< round $ exponentialBoth 3.0 0.0 1.0 0.1
      Assert.equal 0.032  <<< round $ exponentialBoth 3.0 0.0 1.0 0.2
      Assert.equal 0.108  <<< round $ exponentialBoth 3.0 0.0 1.0 0.3
      Assert.equal 0.256  <<< round $ exponentialBoth 3.0 0.0 1.0 0.4
      Assert.equal 0.5    <<< round $ exponentialBoth 3.0 0.0 1.0 0.5
      Assert.equal 0.744  <<< round $ exponentialBoth 3.0 0.0 1.0 0.6
      Assert.equal 0.892  <<< round $ exponentialBoth 3.0 0.0 1.0 0.7
      Assert.equal 0.968  <<< round $ exponentialBoth 3.0 0.0 1.0 0.8
      Assert.equal 0.996  <<< round $ exponentialBoth 3.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialBoth 3.0 0.0 1.0 1.0
      Assert.equal 0.0    <<< round $ exponentialBoth 4.0 0.0 1.0 0.0
      Assert.equal 0.0008 <<< round $ exponentialBoth 4.0 0.0 1.0 0.1
      Assert.equal 0.0128 <<< round $ exponentialBoth 4.0 0.0 1.0 0.2
      Assert.equal 0.0648 <<< round $ exponentialBoth 4.0 0.0 1.0 0.3
      Assert.equal 0.2048 <<< round $ exponentialBoth 4.0 0.0 1.0 0.4
      Assert.equal 0.5    <<< round $ exponentialBoth 4.0 0.0 1.0 0.5
      Assert.equal 0.7952 <<< round $ exponentialBoth 4.0 0.0 1.0 0.6
      Assert.equal 0.9352 <<< round $ exponentialBoth 4.0 0.0 1.0 0.7
      Assert.equal 0.9872 <<< round $ exponentialBoth 4.0 0.0 1.0 0.8
      Assert.equal 0.9992 <<< round $ exponentialBoth 4.0 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ exponentialBoth 4.0 0.0 1.0 1.0
