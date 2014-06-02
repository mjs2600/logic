# Simple logic programming
# http://lambda-the-ultimate.org/node/1494
# http://pobox.com/~oleg/ftp/Scheme/sokuza-kanren.scm
defmodule Logic do
  use Application

  # See http://elixir-lang.org/docs/stable/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Logic.Worker, [arg1, arg2, arg3])
    ]

    # See http://elixir-lang.org/docs/stable/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Logic.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def fail(_) do
    []
  end

  def succeed(query) do
    [query]
  end

  def disjoin(function1, function2) do
    fn(x) ->
      Enum.concat(function1.(x), function2.(x))
    end
  end

  def conjoin(function1, function2) do
    fn(x) ->
      Enum.flat_map(function1.(x), function2)
    end
  end

  # TODO: Replace this with Logic.Variable
  def variable(name) do
    Logic.Variable.new(name)
  end
end
