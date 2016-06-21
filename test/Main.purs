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
    test "quadIn" do
      Assert.equal 0.0  <<< round $ quadIn 0.0 1.0 0.0
      Assert.equal 0.01 <<< round $ quadIn 0.0 1.0 0.1
      Assert.equal 0.04 <<< round $ quadIn 0.0 1.0 0.2
      Assert.equal 0.09 <<< round $ quadIn 0.0 1.0 0.3
      Assert.equal 0.16 <<< round $ quadIn 0.0 1.0 0.4
      Assert.equal 0.25 <<< round $ quadIn 0.0 1.0 0.5
      Assert.equal 0.36 <<< round $ quadIn 0.0 1.0 0.6
      Assert.equal 0.49 <<< round $ quadIn 0.0 1.0 0.7
      Assert.equal 0.64 <<< round $ quadIn 0.0 1.0 0.8
      Assert.equal 0.81 <<< round $ quadIn 0.0 1.0 0.9
      Assert.equal 1.0  <<< round $ quadIn 0.0 1.0 1.0

    test "quadOut" do
      Assert.equal 0.0  <<< round $ quadOut 0.0 1.0 0.0
      Assert.equal 0.19 <<< round $ quadOut 0.0 1.0 0.1
      Assert.equal 0.36 <<< round $ quadOut 0.0 1.0 0.2
      Assert.equal 0.51 <<< round $ quadOut 0.0 1.0 0.3
      Assert.equal 0.64 <<< round $ quadOut 0.0 1.0 0.4
      Assert.equal 0.75 <<< round $ quadOut 0.0 1.0 0.5
      Assert.equal 0.84 <<< round $ quadOut 0.0 1.0 0.6
      Assert.equal 0.91 <<< round $ quadOut 0.0 1.0 0.7
      Assert.equal 0.96 <<< round $ quadOut 0.0 1.0 0.8
      Assert.equal 0.99 <<< round $ quadOut 0.0 1.0 0.9
      Assert.equal 1.0  <<< round $ quadOut 0.0 1.0 1.0

    test "quadBoth" do
      Assert.equal 0.0  <<< round $ quadBoth 0.0 1.0 0.0
      Assert.equal 0.02 <<< round $ quadBoth 0.0 1.0 0.1
      Assert.equal 0.08 <<< round $ quadBoth 0.0 1.0 0.2
      Assert.equal 0.18 <<< round $ quadBoth 0.0 1.0 0.3
      Assert.equal 0.32 <<< round $ quadBoth 0.0 1.0 0.4
      Assert.equal 0.5  <<< round $ quadBoth 0.0 1.0 0.5
      Assert.equal 0.68 <<< round $ quadBoth 0.0 1.0 0.6
      Assert.equal 0.82 <<< round $ quadBoth 0.0 1.0 0.7
      Assert.equal 0.92 <<< round $ quadBoth 0.0 1.0 0.8

    test "cubicIn" do
      Assert.equal 0.0   <<< round $ cubicIn 0.0 1.0 0.0
      Assert.equal 0.001 <<< round $ cubicIn 0.0 1.0 0.1
      Assert.equal 0.008 <<< round $ cubicIn 0.0 1.0 0.2
      Assert.equal 0.027 <<< round $ cubicIn 0.0 1.0 0.3
      Assert.equal 0.064 <<< round $ cubicIn 0.0 1.0 0.4
      Assert.equal 0.125 <<< round $ cubicIn 0.0 1.0 0.5
      Assert.equal 0.216 <<< round $ cubicIn 0.0 1.0 0.6
      Assert.equal 0.343 <<< round $ cubicIn 0.0 1.0 0.7
      Assert.equal 0.512 <<< round $ cubicIn 0.0 1.0 0.8
      Assert.equal 0.729 <<< round $ cubicIn 0.0 1.0 0.9
      Assert.equal 1.0   <<< round $ cubicIn 0.0 1.0 1.0

    test "cubicOut" do
      Assert.equal 0.0   <<< round $ cubicOut 0.0 1.0 0.0
      Assert.equal 0.271 <<< round $ cubicOut 0.0 1.0 0.1
      Assert.equal 0.488 <<< round $ cubicOut 0.0 1.0 0.2
      Assert.equal 0.657 <<< round $ cubicOut 0.0 1.0 0.3
      Assert.equal 0.784 <<< round $ cubicOut 0.0 1.0 0.4
      Assert.equal 0.875 <<< round $ cubicOut 0.0 1.0 0.5
      Assert.equal 0.936 <<< round $ cubicOut 0.0 1.0 0.6
      Assert.equal 0.973 <<< round $ cubicOut 0.0 1.0 0.7
      Assert.equal 0.992 <<< round $ cubicOut 0.0 1.0 0.8
      Assert.equal 0.999 <<< round $ cubicOut 0.0 1.0 0.9
      Assert.equal 1.0   <<< round $ cubicOut 0.0 1.0 1.0

    test "cubicBoth" do
      Assert.equal 0.0   <<< round $ cubicBoth 0.0 1.0 0.0
      Assert.equal 0.004 <<< round $ cubicBoth 0.0 1.0 0.1
      Assert.equal 0.032 <<< round $ cubicBoth 0.0 1.0 0.2
      Assert.equal 0.108 <<< round $ cubicBoth 0.0 1.0 0.3
      Assert.equal 0.256 <<< round $ cubicBoth 0.0 1.0 0.4
      Assert.equal 0.5   <<< round $ cubicBoth 0.0 1.0 0.5
      Assert.equal 0.744 <<< round $ cubicBoth 0.0 1.0 0.6
      Assert.equal 0.892 <<< round $ cubicBoth 0.0 1.0 0.7
      Assert.equal 0.968 <<< round $ cubicBoth 0.0 1.0 0.8
      Assert.equal 0.996 <<< round $ cubicBoth 0.0 1.0 0.9
      Assert.equal 1.0   <<< round $ cubicBoth 0.0 1.0 1.0

    test "quarticIn" do
      Assert.equal 0.0    <<< round $ quarticIn 0.0 1.0 0.0
      Assert.equal 0.0001 <<< round $ quarticIn 0.0 1.0 0.1
      Assert.equal 0.0016 <<< round $ quarticIn 0.0 1.0 0.2
      Assert.equal 0.0081 <<< round $ quarticIn 0.0 1.0 0.3
      Assert.equal 0.0256 <<< round $ quarticIn 0.0 1.0 0.4
      Assert.equal 0.0625 <<< round $ quarticIn 0.0 1.0 0.5
      Assert.equal 0.1296 <<< round $ quarticIn 0.0 1.0 0.6
      Assert.equal 0.2401 <<< round $ quarticIn 0.0 1.0 0.7
      Assert.equal 0.4096 <<< round $ quarticIn 0.0 1.0 0.8
      Assert.equal 0.6561 <<< round $ quarticIn 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ quarticIn 0.0 1.0 1.0

    test "quarticOut" do
      Assert.equal 0.0    <<< round $ quarticOut 0.0 1.0 0.0
      Assert.equal 0.3439 <<< round $ quarticOut 0.0 1.0 0.1
      Assert.equal 0.5904 <<< round $ quarticOut 0.0 1.0 0.2
      Assert.equal 0.7599 <<< round $ quarticOut 0.0 1.0 0.3
      Assert.equal 0.8704 <<< round $ quarticOut 0.0 1.0 0.4
      Assert.equal 0.9375 <<< round $ quarticOut 0.0 1.0 0.5
      Assert.equal 0.9744 <<< round $ quarticOut 0.0 1.0 0.6
      Assert.equal 0.9919 <<< round $ quarticOut 0.0 1.0 0.7
      Assert.equal 0.9984 <<< round $ quarticOut 0.0 1.0 0.8
      Assert.equal 0.9999 <<< round $ quarticOut 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ quarticOut 0.0 1.0 1.0

    test "quarticBoth" do
      Assert.equal 0.0    <<< round $ quarticBoth 0.0 1.0 0.0
      Assert.equal 0.0008 <<< round $ quarticBoth 0.0 1.0 0.1
      Assert.equal 0.0128 <<< round $ quarticBoth 0.0 1.0 0.2
      Assert.equal 0.0648 <<< round $ quarticBoth 0.0 1.0 0.3
      Assert.equal 0.2048 <<< round $ quarticBoth 0.0 1.0 0.4
      Assert.equal 0.5    <<< round $ quarticBoth 0.0 1.0 0.5
      Assert.equal 0.7952 <<< round $ quarticBoth 0.0 1.0 0.6
      Assert.equal 0.9352 <<< round $ quarticBoth 0.0 1.0 0.7
      Assert.equal 0.9872 <<< round $ quarticBoth 0.0 1.0 0.8
      Assert.equal 0.9992 <<< round $ quarticBoth 0.0 1.0 0.9
      Assert.equal 1.0    <<< round $ quarticBoth 0.0 1.0 1.0
