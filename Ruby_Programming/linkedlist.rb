class Node
  attr_accessor :value, :next_node

  def initialize(value=nil)
    #TODO: allow *params to be created
    @value = value
    @next_node = nil
  end

end


class LinkedList

  def initialize(node=nil)
    if node.nil?
      @head = node
    else
      @head = Node.new(node)
    end
  end

  def append(element)
    if @head.nil?
      @head = Node.new(element)
    else
      current = @head
      until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = Node.new(element)
    end
  end

  def prepend(element)
    if @head.nil?
      @head = Node.new(element)
    else
      present_head = @head
      @head = Node.new(element)
      @head.next_node = present_head
    end
  end

  def size
    if @head.nil?
      0
    else
      count = 1
      current = @head
      until current.next_node.nil?
        count += 1
        current = current.next_node
      end
      count
    end
  end

  def head
    if @head.nil?
      nil
    else
      @head.value
    end
  end

  def tail
    if @head.nil?
      nil
    else
      current = @head
      until current.next_node.nil?
        current = current.next_node
      end
      current.value
    end
  end

  def at index
    if @head.nil? or index >= size
      nil
    else
      position = 0
      current = @head
      unless index == position
        position += 1
        current = current.next_node
      end
      current.value
    end
  end

  def pop
    if @head.nil?     # pop returns nil if list is empty
      nil
    else
      current = @head
      # pop returns head and empties the list if it has only one element
      if current.next_node.nil?
        @head = nil
        return current
      end
      # if list has >1 element, check if the one after the current is the last
      until current.next_node.next_node.nil?
        current = current.next_node
      end
      last = current.next_node
      current.next_node = nil
      last.value
    end
  end

  def contains? (element)
    if @head.nil?
      false
    else
      current = @head
      begin
        return true if element == current.value
        current = current.next_node
      end until current.nil? or current.next_node.nil?
      return false
    end
  end

  def find element
    position = 0
    current = @head
    until current.nil?
      return position if element == current.value
      current = current.next_node
      position += 1
    end
    nil
  end

  def to_s
    current = @head
    until current.nil?
      print "( #{current.value} ) -> "
      current = current.next_node
    end
    print 'nil'
  end

  def insert_at(element,index)
    if index > size
      index = size
    end
    if index == 0
      prepend element
    else
      position = 1
      current = @head
      until position == index
        current = current.next_node
        position += 1
      end
      store = current.next_node
      current.next_node = Node.new(element)
      current.next_node.next_node = store
    end
    self
  end

  def remove_at(index)
    # Unless list is empty, assumes index is a valid element of the list
    if @head.nil?
      return nil
    else
      position = 1
      current = @head
      until position == index
        current = current.next_node
        position += 1
      end
      current.next_node = current.next_node.next_node
    end
    self
  end

end
