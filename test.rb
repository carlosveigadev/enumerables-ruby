require './main.rb'

puts "my_each"
puts "\n"
a = %w[a b c]
a.each {|x| print x, " -- " }
puts "\n\n\n"

puts "my_each_with_index"
puts "\n"
hash = Hash.new
%w(cat dog wombat).each_with_index { |item, index| hash[item] = index }
puts hash
puts "\n\n\n"

puts "my_select"
puts "\n"
print [1,2,3,4,5].select { |num|  num.even? }
puts "\n\n\n"

puts "my_all"
puts %w[ant bear cat].all? { |word| word.length >= 3 }
puts %w[ant bear cat].all? { |word| word.length >= 4 }
puts %w[ant bear cat].all?(/t/)                        
puts [1, 2i, 3.14].all?(Numeric)                       
puts [nil, true, 99].all?                              
puts [].all?         
puts "\n\n\n"


