  require './main.rb'

  describe "#my_each" do
    it "should return the iteration of an array" do
      array_words = %w[a b c]
      result = []
      expect(array_words.my_each{ |w| result << w }).to eql(result)
    end  
  end
