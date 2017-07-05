class Timer
  #write your code here
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    hours = padded((@seconds / 3600).to_s)
    minutes = padded(((@seconds / 60) % 60).to_s)
    secs = padded((@seconds % 60).to_s)
    "#{hours}:#{minutes}:#{secs}"
  end

  def padded num
    num = num.to_s
    num = num.prepend('0') if num.length < 2
    num
  end

end
