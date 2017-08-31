def fibs n
  fibs = [0, 1]
  (n-1).times { fibs << fibs[-1] + fibs[-2] }
  fibs
end

def fibs_rec n
  ary = []
  fibs_help(n, 1, 0, ary)
  ary
end

def fibs_help n, i, j, ary
  ary << j
  fibs_help(n - 1, i+j, i, ary) if n != 0
end

p fibs_rec 28
