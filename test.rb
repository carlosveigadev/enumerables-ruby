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


