class A
  def initialize(string, number)
    @string = string
    @number = number
  end

  def to_s
    "In A:\n   #{@string}, #{@number}\n"
  end
end

a = A.new("hello world", 5)
puts a
serialized_object = Marshal::dump(a)
puts Marshal::load(serialized_object)
