module Enumerable
  def my_each
    copy = []
    for i in (0..(self.length-1))
      copy << yield(self[i])
    end
    copy
  end

  def my_each_with_index
    copy = []
    for i in (0..(self.length-1))
      copy << yield(self[i], i)
    end
    copy
  end

  def my_select
    copy = []
    self.my_each { |i| copy << i if yield i }
    copy
  end

  def my_all?
    self.my_each do |i|
      return false if not yield i
    end
    true
  end

  def my_any?
    self.my_each do |i|
      return true if yield i
    end
    false
  end

  def my_none?
    self.my_each do |i|
      return false if yield i
    end
    true
  end

  def my_count
    count = 0
    self.my_each { |i| count += 1}
    count
  end

  # Original my_map
  # def my_map
  #   copy = []
  #   self.my_each do |i|
  #     copy << yield(i)
  #   end
  #   copy
  # end

  # my_map that takes a proc
  # def my_map(a_proc)
  #   copy = []
  #   self.my_each do |i|
  #     copy << a_proc.call(i)
  #   end
  #   copy
  # end

  def my_map(a_proc=nil)
    copy = []
    for i in self
      copy << yield(i) if (a_proc.nil?) and (block_given?)
      copy << a_proc.call(i) unless (a_proc.nil?) or (not a_proc.is_a? Proc)
    end
    copy
  end

  def my_inject(arg=0)
    for i in (0..self.length-1)
      arg = yield(arg, self[i])
    end
    arg
  end
end

def multiply_els array
  product = array.my_inject(1) { |prod, i| prod * i }
  product
end

array = [0, 1, 2, 3, 4]
t21 = Proc.new { |i| i * 21 }
p array.my_map(t21)
