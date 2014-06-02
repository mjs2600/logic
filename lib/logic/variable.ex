defmodule Logic.Variable do
  defstruct name: ""

  def new(name) do
    %Logic.Variable{name: name}
  end
end
