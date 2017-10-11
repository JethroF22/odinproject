def clock &block
  hour = Time.now.hour % 12
  if hour == 0
    hour = 12
  end

  hour.times do |t|
    block.call(t)  # This doesn't work
  end
end

clock do puts 'DONG!' end
clock do  puts "#{t} o'clock has come and gone..." end
