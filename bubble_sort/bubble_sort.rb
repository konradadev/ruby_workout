def bubble_sort(unsorted_array)
  for i in 1..unsorted_array.length
    swaps = 0
    unsorted_array.each_with_index do |number, index|
      unless index == unsorted_array.length-1
        next_number = unsorted_array[index+1]
        if next_number < number
          helper = number
          unsorted_array[index] = next_number
          unsorted_array[index+1] = helper
          swaps += 1
        end
      end
    end
    if swaps == 0
      return unsorted_array
    end
  end
  return unsorted_array
end

array_example = [4,3,78,2,0,2]
array_sorted = bubble_sort(array_example)
print array_sorted
