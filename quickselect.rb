require 'pry'
class QuickSelect
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def partition(left_pointer=0, right_pointer=(@array.length - 2))
    pivot_position = right_pointer
    pivot = @array[pivot_position]
    while true
      # binding.pry
      while @array[left_pointer] < pivot
        left_pointer += 1
      end

      while @array[right_pointer] > pivot
        right_pointer -=1
      end

      if left_pointer >= right_pointer
        return left_pointer
      else
        @array[left_pointer], @array[right_pointer] = @array[right_pointer], @array[left_pointer]
      end
    end
  end

  def quick_select(desired_index, left_index=0, right_index=(@array.length - 1))
    p @array
    if right_index - left_index <= 0
      return @array[left_index]
    end
    pivot_index = partition(left_index, right_index)
    if pivot_index > desired_index
      quick_select(desired_index, left_index, pivot_index - 1)
    elsif pivot_index < desired_index
      quick_select(desired_index, pivot_index + 1, right_index)
    else
      @array[pivot_index]
    end
  end
end

array = QuickSelect.new([2,6,3,4,5,2,4,5])
p array.quick_select(2)
