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


end
