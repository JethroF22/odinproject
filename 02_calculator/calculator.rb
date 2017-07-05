#write your code here
def add a, b
  a + b
end

def subtract x, y
  x - y
end

def sum arr
  sum = 0
  arr.each { |i| sum += i }
  sum
end

def multiply(*args)
  product = 1
  args.each { |i| product *= i }
  product
end

def power x, y
  x**y
end

def factorial n
  if n == 0
    return 1
  else
    return n * factorial(n-1)
  end
end
