defprotocol Logic.Data do
  @fallback_to_any true
  def variable?(_)
end

defimpl Logic.Data, for: Logic.Variable do
  def variable?(_) do
    true
  end
end

defimpl Logic.Data, for: Any do
  def variable?(_) do
    false
  end
end
