  require './main.rb'

  describe "#my_each" do
    let(:result) { [] }
    it "should return the iteration of an array with words" do
      array_words = %w[a b c]
      expect(array_words.my_each{ |w| result << w }).to eql(result)
    end
    
    it "should retrun the iteration of an array with numbers" do
      array_numbers = [1, 2, 3, 4, 5]
      expect(array_numbers.my_each{ |n| result << n}).to eql(result)
    end
    
    
  end
