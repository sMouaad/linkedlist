class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, node = nil)
    @value = value
    @next_node = node
  end
end
