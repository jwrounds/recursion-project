require "pry"

def fibs n
  if n < 3 
    return 1
  else
    i = n - 2 
    fib_a = 1 
    fib_b = 1
    while i > 0      
      fib = fib_a + fib_b
      fib_b = fib_a
      fib_a = fib
      i -= 1
    end
    return fib
  end
end

def fibs_rec n
  n < 3 ? 1 : fibs_rec(n-1) + fibs_rec(n-2) if n > 0
end


# merge sort 
# 1. sort left half of array
# 2. sort right half of array
# merge sorted halves

def merge_sort arr

  return arr if arr.length == 1

  # sort left half of arr
  left_arr = arr[0..((arr.length / 2 ) - 1)]
  left_sorted = merge_sort(left_arr)
  
  # sort right half of arr
  right_arr = arr[(arr.length / 2)..-1]
  right_sorted = merge_sort(right_arr)
  
  # merge
  merge_array(left_sorted, right_sorted)
end

def merge_array arr1, arr2
  merged = []

  i = 0
  j = 0
  array_exhausted = false

  until array_exhausted do

      if arr1[i] < arr2[j]
        merged << arr1[i]
        i += 1
      elsif arr2[j] < arr1[i]
        item = arr2[j]
        merged << item
        j += 1
      end
      if j == arr2.length  
        arr1.each_with_index do |element, index| 
          merged << element if index >= i
        end
        array_exhausted = true
      elsif i == arr1.length
        arr2.each_with_index do |element, index| 
          merged << element if index >= j
        end
        array_exhausted = true
      end
    end

  merged
end

p merge_array([3, 4, 5,], [1, 2, 6, 8])

p merge_sort([3, 1, 2, 4, 6, 9, 5])