class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def print
    if @parent.nil?
      print "ROOT"
    else
      print "Parent: #{@parent.value}"
    end
    puts "\nValue: #{@value}"
    puts "Left child: #{@left.value}" unless @left.nil?
    puts "Right child: #{@right.value}" unless @right.nil?
  end

  def to_s
    @value
  end

end

def build_tree(array)
  root = Node.new(array[0])
  array[1..-1].each do |element|
    node = Node.new(element)
    insert(node, root)
  end
  root
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
      node.parent = root.parent
      if (not root.parent.nil?) and node.value > root.parent.value
        root.parent.right = node
      elsif (not root.parent.nil?) and node.value < root.parent.value
        root.parent.left = node
      end
      root.parent = node
      root.left = nil
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
      node.parent = root.parent
      if (not root.parent.nil?) and node.value > root.parent.value
        root.parent.right = node
      elsif (not root.parent.nil?) and node.value < root.parent.value
        root.parent.left = node
      end
      root.parent = node
      root.right = nil
    else
      insert(node, root.right)
    end
  end
end

def breadth_first_search(node, query)
  queue = [node]
  while queue.length > 0
    return queue[0] if queue[0].value == query
    queue << queue[0].left unless queue[0].left.nil?
    queue << queue[0].right unless queue[0].right.nil?
    queue.shift
  end
  nil
end

def depth_first_search(node, query)
  stack = [node]
  while stack.length > 0
    last = stack.pop
    return last if last.value == query
    stack << last.right unless last.right.nil?
    stack << last.left unless last.left.nil?
  end
  nil
end

def dfs_rec(node, query, found=nil)
  if node.value == query
    found = node
  end
  left = dfs_rec(node.left, query, found) unless node.left.nil? or found
  found = left if not left.nil?
  right = dfs_rec(node.right, query, found) unless node.right.nil? or found
  found = right if not right.nil?
  found
end
