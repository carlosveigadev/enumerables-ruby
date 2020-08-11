  require './main.rb'

  describe "#my_each" do
    let(:result) { [] }
    let(:array_words) {%w[a b c]}
    let(:array_numbers) {[1, 2, 3, 4, 5]}
    it "should return the iteration of an array with words" do
      expect(array_words.my_each{ |w| result << w }).to eql(result)
    end
    
    it "should return the iteration of an array with numbers" do
      expect(array_numbers.my_each{ |n| result << n}).to eql(result)
    end

    it "should return an enumerator whenever a block is not passed" do
      expect(array_numbers.my_each).to be_an Enumerator
    end

    
  end
