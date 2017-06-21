cost = 9.48
given = 10

change_back = {'pennies' => 0, 'nickels' => 0, 'dimes' => 0, 'quarters' => 0}
change = { 25 => 'quarters', 10 => 'dimes', 5 => 'nickels', 1 => 'pennies' }
remainder = (given * 100) - (cost - 100)

while remainder > 0
  console
  change.each do |k, v|
    if remainder - k >= 0
      remainder -= k
      change_back[change[k]] += 1
    end
  end
end

puts change_back