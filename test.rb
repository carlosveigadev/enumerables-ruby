require './main.rb'

puts 'my_each'
puts '\n'
a = %w[a b c]
a.each { |x| print x, ' -- ' } #=> a -- b -- c --
puts "\n\n\n"

puts 'my_each_with_index'
puts '\n'
hash = {}
%w[cat dog wombat].my_each_with_index { |item, index| hash[item] = index }
#=> {'cat'=>0, 'dog'=>1, 'wombat'=>2}
puts hash
puts "\n\n\n"

puts 'my_select'
puts '\n'
puts [1,2,3,4,5].my_select { |num|  num.even? } #=> [2, 4]
puts "\n\n\n"

puts 'my_all?'
puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].my_all?(/t/)                        #=> false
puts [1, 2i, 3.14].my_all?(Numeric)                       #=> true
puts [nil, true, 99].my_all?                              #=> false
puts [].my_all?                                           #=> true 
puts "\n\n\n"

puts 'my_any?'
puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
puts %w[ant bear cat].my_any?(/d/)                        #=> false
puts [nil, true, 99].my_any?(Integer)                     #=> true
puts [nil, true, 99].my_any?                              #=> true
puts [].my_any?                                           #=> false
puts "\n\n\n"

puts 'my_none?'
puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
puts %w{ant bear cat}.my_none?(/d/)                        #=> true
puts [1, 3.14, 42].my_none?(Float)                         #=> false
puts [].my_none?                                           #=> true
puts [nil].my_none?                                        #=> true
puts [nil, false].my_none?                                 #=> true
puts [nil, false, true].my_none?                           #=> false
puts "\n\n\n"

puts 'my_count'
ary = [1, 2, 4, 2]
puts ary.count               #=> 4
puts ary.count(2)            #=> 2
puts ary.count{ |x| x%2==0 } #=> 3
puts "\n\n\n"

puts 'my_map'
puts (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]
puts "\n\n\n"

puts 'my_inject'
puts (5..10).my_inject { |sum, n| sum + n }         #=> 45
puts (5..10).inject(1) { |product, n| product * n } #=> 151200
longest = %w{ cat sheep bear }.my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts longest                                        #=> 'sheep'
puts "\n\n\n"

puts 'myltiply_els'
puts multiply_els([2,4,5]) #=> 40