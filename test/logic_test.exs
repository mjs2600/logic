defmodule LogicTest do
  use ExUnit.Case

  test "failure" do
    result = Logic.fail(:q)
    assert result == []
  end

  test "success" do
    result = Logic.succeed(:q)
    assert result == [:q]
  end

  test "disjunction" do
    result = Logic.disjoin(&Logic.succeed/1, &Logic.fail/1).(:q)
    assert result == [:q]

    result = Logic.disjoin(&Logic.fail/1, &Logic.fail/1).(:q)
    assert result == []
  end

  test "conjunction" do
    result = Logic.conjoin(&Logic.succeed/1, &Logic.fail/1).(:q)
    assert result == []

    result = Logic.conjoin(&Logic.succeed/1, &Logic.succeed/1).(:q)
    assert result == [:q]
  end
end
