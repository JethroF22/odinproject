require "my_enums"

describe "My_Enumerables" do

  let(:enums) { Class.new { include My_Enumerables } }
  before(:all) do
    empty = []
    zero123 = [0, 1, 2, 3]
    same = Proc.new { |elt| elt }
    plus_one = Proc.new { |elt| elt + 1 }

    describe "#my_each" do

      context "when called by an empty array" do
        it "returns an empty array" do
          a = empty.enums.my_each(&plus_one)
          expect(a).to eq([])
        end
      end

      context "when called by a non-empty array" do
        it "returns the same array with a 'same' block" do
          b = zero123.enums.my_each(&same)
          expect(b).to eq([0, 1, 2, 3])
        end

        it "returns each element plus one with a 'plus_one' block" do
          c = zero123.enums.my_each(&plus_one)
          expect(c).to eq([1, 2, 3, 4])
        end
      end
    end
  end
end
