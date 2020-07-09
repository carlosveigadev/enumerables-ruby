module Enumerable
  def my_each
    return enum_for(__method__) unless block_given?
    size.times { |i| yield to_a[i] }
    self
  end
end
