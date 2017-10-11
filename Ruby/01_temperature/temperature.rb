#write your code here
def ftoc(tempf)
  tempc = (tempf - 32) * 5 / 9.0
  tempc
end

def ctof(tempc)
  tempf = (tempc * 9 / 5.0) + 32
end
