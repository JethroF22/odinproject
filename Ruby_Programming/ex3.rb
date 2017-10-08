bottles = 99

while bottles > 0
  print "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.
  "
  bottles -= 1
  print "Take one down and pass it around, #{bottles == 0 ? 'no more' : bottles} #{bottles == 1 ? 'bottle' : 'bottles'} of beer on the wall.

  "
end

print "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall."
