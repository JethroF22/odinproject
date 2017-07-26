def and_op(a,b)
  a && b
end

def or_op(a,b)
  a || b
end

def not_op(a)
  !a
end

def print_and_op(a,b)
  return_value = and_op(a,b)
  if return_value
    puts "#{a.inspect} && #{b.inspect} returns #{return_value.inspect}, which is truthy"
  else
    puts "#{a.inspect} && #{b.inspect} returns #{return_value.inspect}, which is falsey"
  end
end

def print_or_op(a,b)
  return_value = or_op(a,b)
  if return_value
    puts "#{a.inspect} || #{b.inspect} returns #{return_value.inspect}, which is truthy"
  else
    puts "#{a.inspect} || #{b.inspect} returns #{return_value.inspect}, which is falsey"
  end
end

def print_not_op(a)
  return_value = not_op(a)
  if return_value
    puts "!#{a.inspect} returns #{return_value.inspect}, which is truthy"
  else
    puts "!#{a.inspect} returns #{return_value.inspect}, which is falsey"
  end
end

# Let's see how these guys work..
print_and_op(true,1)
print_and_op(true,Object)
print_and_op(true,"")
print_and_op(true, nil)
print_and_op(false, 1)
print_and_op(false, Object)
print_and_op(false, "")
print_and_op(false, false)
print_and_op(nil, false)
print_and_op(false, nil)
print_and_op(false, true)
print_and_op(nil, true)

# Now play around it with || and ! using print_or_op and print_not_op
# Can you come up with a simple rule for what && returns?
# How about || and ! ?

print_or_op(true,1)
print_or_op(true,Object)
print_or_op(true,"")
print_or_op(true, nil)
print_or_op(false, 1)
print_or_op(false, Object)
print_or_op(false, "")
print_or_op(false, false)
print_or_op(nil, false)
print_or_op(false, nil)
print_or_op(false, true)
print_or_op(nil, true)

print_not_op(1)
print_not_op(Object)
print_not_op("")
print_not_op(true)
print_not_op(false)
print_not_op(nil)
