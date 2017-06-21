array = [1,1,1,1,1,2,2,2,2,3,3,3,3,3,3]
sum = 0
array.each do |number|
  old_sum = sum
  sum += number
  if (sum - old_sum) != 1
    puts old_sum + 1
    break
  end
end
