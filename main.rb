module Enumerable
  def my_each
    return enum_for(__method__) unless block_given?
    size.times { |i| yield to_a[i] }
    self
  end

  def my_each_with_index
    return enum_for(__method__) unless block_given?
    size.times { |i| yield to_a[i], i }
    self
  end

  def my_select
    return enum_for(__method__) unless block_given?

    array = []
    my_each { |n| array << n if yield n }
    array
  end

  def my_all?(arg = nil)
    puts "#{__FILE__}:#{__LINE__}: w: block not used" if arg && block_given?
    return my_all_extra_func(arg) if arg

    if !block_given?
      size.times { |n| return false if to_a[n] == false || to_a[n].nil? }
    else
      my_each { |n| return false unless yield n }
    end
    true
  end

  def my_all_extra_func(arg)
    if arg.is_a?(Regexp)
      my_each { |n| (n =~ arg).nil? ? false : 'Error' }
      true
    elsif arg
      my_each { |n| return false unless n.is_a? arg }
    end
  end
end
