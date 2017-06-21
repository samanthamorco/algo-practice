array = [1, 6, 4, 3, 2, 7, 10, 4, 54, 4]

def partition(left_index, right_index):
    pivot_index = right_index
    left_pointer = left_index
    right_pointer = right_index - 1

    while True:
        while array[left_pointer] <= array[pivot_index] and left_pointer != right_index:
            left_pointer += 1
        while array[right_pointer] >= array[pivot_index] and right_pointer != left_index:
            right_pointer -= 1

        if left_pointer >= right_pointer:
            temp_value = array[left_pointer]
            array[left_pointer] = array[pivot_index]
            array[pivot_index] = temp_value
            return left_pointer
        else:
            temp_value = array[left_pointer]
            array[left_pointer] = array[right_pointer]
            array[right_pointer] = temp_value

def quick_select(desired_index, left_index, right_index):
    if right_index - left_index <= 0:
        return array[left_index]

    pivot_index = partition(left_index, right_index)

    if pivot_index > desired_index:
        return quick_select(desired_index, left_index, pivot_index - 1)
    elif pivot_index < desired_index:
        return quick_select(desired_index, pivot_index + 1, right_index)
    else:
        return array[pivot_index]

print(quick_select(2, 0, len(array) - 1))