require 'yaml'

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_yaml
    YAML.dump ({
      :name => @name,
      :age => @age,
      :gender => @gender
      })
  end

  def self.from_yaml(string)
    data = YAML.load string
    p data
    self.new(data[:name], data[:age], data[:gender])
  end
end

p = Person.new "Poletra", 28, "samambaia"
p p.to_yaml

q = Person.from_yaml(p.to_yaml)
puts "Name #{q.name}"
puts "Age #{q.age}"
puts "Gender #{q.gender}"
