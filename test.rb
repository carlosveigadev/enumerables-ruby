require './main.rb'

puts "my_each"
puts "\n"
a = %w[a b c]
a.each {|x| print x, " -- " } #=> a -- b -- c --
puts "\n\n\n"

puts "my_each_with_index"
puts "\n"
hash = Hash.new
%w(cat dog wombat).each_with_index { |item, index| hash[item] = index } #=> {"cat"=>0, "dog"=>1, "wombat"=>2}
puts hash
puts "\n\n\n"

puts "my_select"
puts "\n"
print [1,2,3,4,5].select { |num|  num.even? } #=> [2, 4]
puts "\n\n\n"

puts "my_all?"
puts %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].all?(/t/)                        #=> false
puts [1, 2i, 3.14].all?(Numeric)                       #=> true
puts [nil, true, 99].all?                              #=> false
puts [].all?                                           #=> true 
puts "\n\n\n"

puts "my_any?"
puts %w[ant bear cat].any? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].any? { |word| word.length >= 4 } #=> true
puts %w[ant bear cat].any?(/d/)                        #=> false
puts [nil, true, 99].any?(Integer)                     #=> true
puts [nil, true, 99].any?                              #=> true
puts [].any?                                           #=> false
puts "\n\n\n"

puts "my_none?"
puts %w{ant bear cat}.none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
puts %w{ant bear cat}.none?(/d/)                        #=> true
puts [1, 3.14, 42].none?(Float)                         #=> false
puts [].none?                                           #=> true
puts [nil].none?                                        #=> true
puts [nil, false].none?                                 #=> true
puts [nil, false, true].none?                           #=> false
puts "\n\n\n"

puts "my_count"
ary = [1, 2, 4, 2]
puts ary.count               #=> 4
puts ary.count(2)            #=> 2
puts ary.count{ |x| x%2==0 } #=> 3
puts "\n\n\n"

