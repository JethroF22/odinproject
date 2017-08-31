class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @parent
    @left = left
    @right = right
  end

end

def build_tree(array)
  root = Node.new(array[0])
  array[1..-1].each do |element|
    node = Node.new(element)
    insert(node, root)
  end
end

def insert(node, root)
  if node.value < root.value
    if root.left.nil?
      root.left = node
      node.parent = root
    elsif root.right.nil? and root.left.value < node.value
      root.left.parent = node
      node.left = root.left
      node.right = root
      root.parent.right = node if node.value > root.parent.value
      root.parent.left = node if node.value < root.parent.value
      node.parent = root.parent
      root.parent = node
    else
      insert(node, root.left)
    end
  elsif node.value > root.value
    if root.right.nil?
      root.right = node
      node.parent = root
    elsif root.left.nil? and root.right.value > node.value
      root.right.parent = node
      node.right = root.right
      node.left = root
      root.parent.right = node if node.value > root.parent.value
      root.parent.left = node if node.value < root.parent.value
      node.parent = root.parent
      root.parent = node
    else
      insert(node, root.right)
    end
  end
end

build_tree([3, 7, 8, 1, 14, 10, 2, 6, 11, 12, 5, 9, 15, 4, 13])
