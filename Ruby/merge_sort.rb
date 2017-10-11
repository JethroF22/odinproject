def merge_sort ary
  sorted = []
  case ary.size
  when 0, 1
    return ary
  when 2
    return [ary[1], ary[0]] if ary[0] > ary[1]
    return ary
  else
    first_half = merge_sort(ary.slice!(0..ary.size/2))
    second_half = merge_sort(ary)
    while (first_half + second_half).size > 0
      if first_half.empty?
        return sorted + second_half
      elsif second_half.empty?
        return sorted + first_half
      elsif first_half[0] < second_half[0]
        sorted << first_half.shift
      else
        sorted << second_half.shift
      end
    end
  end
  sorted
end

p merge_sort([-1, 6.28, 3, 4, 4, 0, 8, 2, 5])
