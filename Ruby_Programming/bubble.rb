def bubble_sort array
  until sorted? array
    array.each_index do |index|
      if index != (array.length - 1)
        a, b = array[index], array[index + 1]
        array[index + 1], array[index] = a, b if a > b
      end
    end
  end
  array
end

def bubble_sort_by array
  sorted = false
  until sorted
    sorted = true
    array.each_index do |index|
      if index != (array.length - 1)
        result = yield(array[index], array[index+1])
        if result > 0
          array[index + 1], array[index] = array[index], array[index+1]
          sorted = false
        end
      end
    end
  end
  array
end

def sorted? array
  array.each_index do |index|
    if index == array.length - 1
      return true
    else
      return false if array[index] > array[index + 1]
    end
  end
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end
