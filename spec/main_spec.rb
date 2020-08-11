  require './main.rb'
  
  describe "Enumerables" do
    let(:result) { [] }
    let(:array_words) {%w[a b c]}
    let(:array_numbers) {[1, 2, 3, 4, 5]}

    describe "#my_each" do
      it "should return the iteration of an array with words with my_each" do
        expect(array_words.my_each{ |w| result << w }).to eql(result)
      end
      
      it "should return the iteration of an array with numbers to my_each" do
        expect(array_numbers.my_each{ |n| result << n}).to eql(result)
      end

      it "should return an enumerator whenever a block is not passed to my_each" do
        expect(array_numbers.my_each).to be_an Enumerator
      end
    end

    describe "#my_each_with_index" do
      it "should return the iteration of an array with words with my_each_with_index" do
        expect(array_words.my_each_with_index{ |w, _i| result << w }).to eql(result)
      end

      it "should return the iteration of an array with numbers to my_each_with_index" do
        expect(array_numbers.my_each_with_index{ |n, _i| result << n}).to eql(result)
      end

    end


    
  end
