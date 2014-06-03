defmodule Logic.Substitution do
  def empty_subsitutions do
    %{}
  end

  def extend_substitutions(substitutions, variable, value) do
    if Data.variable?(variable) do
      Dict.put(substitutions, variable, value)
    end
  end
end
