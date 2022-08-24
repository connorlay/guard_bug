defmodule GuardBugTest do
  use ExUnit.Case

  # this function is the possible bug
  def f(a, b) when is_integer(b) or is_binary(b) do
    "#{a}_#{b}"
  end

  # this function works just fine
  def g(a, b) when is_integer(b) do
    "#{a}_#{b}"
  end
  
  test "this raises a runtime error" do
    f(A, 2749963626218098647) # possible bug?
  end
  
  test "without the second guard does not raise" do
    g(A, 2749963626218098647)
  end
  
  test "smaller integer does not raise a runtime error" do
    f(A, 274996362621809864) # note the omitted trailing 7
    g(A, 274996362621809864)
  end
end
