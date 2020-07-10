# Recreation of enumerables.
# rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/CaseEquality
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
      my_each { |n| return false unless arg.match? n.to_s }
      true
    elsif arg
      my_each { |n| return false unless arg === n }
    end
    true
  end

  def my_any?(arg = nil)
    if arg
      puts "#{__FILE__}:#{__LINE__}: w: block not used" if block_given?
      return my_any_extra_func(arg)
    elsif block_given?
      my_each { |n| return true if yield n }
    else
      my_each { |n| return true if n }
    end
    false
  end

  def my_any_extra_func(arg)
    if arg.is_a?(Regexp)
      my_each { |n| return true if arg.match? n.to_s }
    else
      my_each { |n| return true if arg === n }
    end
    true
  end

  def my_none?(arg = nil)
    if arg
      puts "#{__FILE__}:#{__LINE__}: w: block not used" if block_given?
      !my_any?(arg)
    elsif block_given?
      !my_any?(&Proc.new)
    else
      !my_any?
    end
  end

  def my_count(arg = 0)
    counter = 0
    if block_given?
      my_each { |n| counter += 1 if yield n }
    elsif arg.zero?
      my_each { counter += 1 }
    else
      my_each { |n| counter += 1 if arg == n }
    end
    counter
  end

  def my_map(method = nil)
    return enum_for(__method__) unless block_given? || method
    mapped = []
    if method
      my_each { |n| mapped << (method.yield n) }
    else
      my_each { |n| mapped << (yield n) }
    end
    mapped
  end

  def my_inject(prm1 = nil, prm2 = nil)
    arr = is_a?(Array) ? self : to_a
    sym = prm1 if prm1.is_a?(Symbol) || prm1.is_a?(String)
    accum = prm1 if prm1.is_a? Integer

    if prm1.is_a?(Integer)
      if prm2.is_a?(Symbol) || prm2.is_a?(String)
        sym = prm2
      elsif !block_given?
        raise "#{prm2} is not a symbol nor a string"
      end
    elsif prm1.is_a?(Symbol) || prm1.is_a?(String)
      raise "#{prm2} is not a symbol nor a string" if !prm2.is_a?(Symbol) && !prm2.nil?

      raise "undefined method `#{prm2}' for :#{prm2}:Symbol" if prm2.is_a?(Symbol) && !prm2.nil?
    end

    if sym
      arr.my_each { |n| accum = accum ? accum.send(sym, n) : n }
    elsif block_given?
      arr.my_each { |n| accum = accum ? yield(accum, n) : n }
    else
      puts 'LocalJumpError'
    end
    accum
  end
end

def multiply_els(arr)
  arr.my_inject { |accum, n| accum * n }
end
# rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/CaseEquality
