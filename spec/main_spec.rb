require './main.rb'

describe 'Enumerables' do
  let(:result) { [] }
  let(:array_words) { %w[ant bear cat] }
  let(:array_numbers) { [1, 2, 3, 4, 5] }

  describe '#my_each' do
    it 'should return the iteration of an array with words with my_each' do
      expect(array_words.my_each { |w| result << w }).to eql(result)
    end

    it 'should return the iteration of an array with numbers to my_each' do
      expect(array_numbers.my_each { |n| result << n }).to eql(result)
    end

    it 'should return an enumerator whenever a block is not passed to my_each' do
      expect(array_numbers.my_each).to be_an Enumerator
    end
  end

  describe '#my_each_with_index' do
    it 'should return the iteration of an array with words with my_each_with_index' do
      expect(array_words.my_each_with_index { |w, _i| result << w }).to eql(result)
    end

    it 'should return the iteration of an array with numbers to my_each_with_index' do
      expect(array_numbers.my_each_with_index { |n, _i| result << n }).to eql(result)
    end

    # it "should return the indices of the iteration over an array of words using my_each_with_index" do
    #   expect(array_words.my_each_with_index{ |_n, index| result << index}).to eql(result)
    # end

    it 'should return an enumerator whenever a block is not passed to my_each_with_index' do
      expect(array_numbers.my_each_with_index).to be_an Enumerator
    end
  end

  describe '#my_select' do
    it 'should select the element based on the block' do
      expect(array_numbers.my_select(&:even?)).to eql([2, 4])
    end

    it 'should select the element based on the block' do
      expect(array_numbers.my_select(&:odd?)).to eql([1, 3, 5])
    end

    it 'should return an enumerator whenever a block is not passed to my_select' do
      expect(array_numbers.my_select).to be_an Enumerator
    end
  end

  describe '#my_all' do
    it 'should return true if all the elements on the argument return true after passing the block' do
      expect(array_words.my_all? { |word| word.length >= 3 }).to eql(true)
    end

    it 'should return false if only one of the elements on the argument return false after passing the block' do
      expect(array_words.my_all? { |word| word.length >= 4 }).to eql(false)
    end

    it 'should return true if all the elements on the argument contain the regex passed' do
      expect(array_words.my_all?(/a/)).to eql(true)
    end

    it 'should return false if only one of the elements on the argument do not contain the regex passed' do
      expect(array_words.my_all?(/t/)).to eql(false)
    end

    it 'should return true if all the elements on the array are the same class on the argument' do
      expect(array_numbers.my_all?(Numeric)).to eql(true)
    end

    it 'should return false if at least on element on the array return false or nil' do
      expect([nil, true, 99].my_all?).to eql(false)
    end

    it 'should return true if the array is empty because there is no elements to return nil or false' do
      expect([].my_all?).to eql(true)
    end
  end

  describe '#my_any' do
    it 'should return true if at least one of the elements on the argument return true after passing the block' do
      expect(array_words.my_any? { |word| word.length >= 4 }).to eql(true)
    end

    it 'should return false if none of the elements on the argument return true after passing the block' do
      expect(array_words.my_any? { |word| word.length >= 5 }).to eql(false)
    end

    it 'should return true if at least one of the elements on the argument contain the regex passed' do
      expect(array_words.my_any?(/r/)).to eql(true)
    end

    it 'should return false if none of the elements on the argument contain the regex passed' do
      expect(array_words.my_any?(/z/)).to eql(false)
    end

    it 'should return true if at least one of the elements on the array matches the class on the argument' do
      expect([nil, true, 99].my_any?(Integer)).to eql(true)
    end

    it 'should return true if at least on element on the array return true' do
      expect([nil, false, 99].my_any?).to eql(true)
    end

    it 'should return false if the array is empty because there is no elements to return true' do
      expect([].my_any?).to eql(false)
    end
  end

  describe '#my_none' do
    it 'should return true if none of the elements on the array are equal to the passing the block' do
      expect(array_words.my_none? { |word| word.length == 5 }).to eql(true)
    end

    it 'should return false if at least one of the elements are equal true on the array after passing the block' do
      expect(array_words.my_none? { |word| word.length >= 4 }).to eql(false)
    end

    it 'should return true if none of the elements on the argument contain the regex /d/ passed' do
      expect(array_words.my_none?(/d/)).to eql(true)
    end

    it 'should return false if none of the elements on the argument contain the regex /a/ passed' do
      expect(array_words.my_none?(/a/)).to eql(false)
    end

    it 'should return false if at least one of the elements in the array are equal to the class passed as argument' do
      expect([1, 3.14, 42].my_none?(Float)).to eql(false)
    end

    it 'should return true if the array is empty because there is no elements to compare and return false' do
      expect([].my_none?).to eql(true)
    end

    it 'when an array is nill, and no block is given, returns true because there is nothing to compare with array' do
      expect([nil].my_none?).to eql(true)
    end

    it 'when an array is nill or false, and no block is given, should return true because there is nothing to compare with the array' do
      expect([nil, false].my_none?).to eql(true)
    end

    it 'If the block is not given, my_none? will return true only if none of the elements on the array is equal to true.' do
      expect([nil, false, true].my_none?).to eql(false)
    end

    it 'should return true if at least one of the elements on the array matches the class on the argument' do
      expect([nil, true, 99].my_any?(Integer)).to eql(true)
    end

    it 'should return true if at least on element on the array return true' do
      expect([nil, false, 99].my_any?).to eql(true)
    end
  end

  describe '#my_count' do
    it 'should count the number of elements on the array' do
      expect(array_numbers.my_count).to eql(array_numbers.count)
    end

    it 'should return the number of elements that are equal to the argument passed as integer' do
      expect(array_numbers.my_count(2)).to eql(array_numbers.count(2))
    end

    it 'should return the number of elements that are equal to the block given' do
      expect(array_numbers.my_count { |x| x%2==0 }).to eql(array_numbers.count { |x| x%2==0 })
    end
  end

  describe '#my_map' do
    it 'Returns a new array with the results of running block once for every element in enumerator' do
      expect((1..4).my_map { |i| i*i }).to eql([1, 4, 9, 16])
    end

    it 'If no block is given, an enumerator is returned instead' do
      expect(array_numbers.my_map).to be_an Enumerator
    end
  end

  
end
