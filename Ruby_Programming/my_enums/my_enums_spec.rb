require "my_enums"

describe "My_Enumerables" do

  class Array
    include My_Enumerables
  end

  empty = []
  zero123 = [0, 1, 2, 3]
  same = Proc.new { |elt| elt }
  plus_one = Proc.new { |elt| elt + 1 }
  with_index = Proc.new { |elt, idx| elt }
  even = Proc.new { |elt| elt % 2 == 0 }

  describe "#my_each" do

    context "when called by an empty array" do
      it "returns an empty array" do
        a = empty.my_each(&plus_one)
        expect(a).to eq([])
      end
    end

    context "when called by a non-empty array" do
      it "returns the same array with a 'same' block" do
        b = zero123.my_each(&same)
        expect(b).to eq([0, 1, 2, 3])
      end

      it "returns each element plus one with a 'plus_one' block" do
        c = zero123.my_each(&plus_one)
        expect(c).to eq([1, 2, 3, 4])
      end
    end
  end

  describe "#my_each_with_index" do

    context "when called by an empty array" do
      it "returns an empty array" do
        a = empty.my_each_with_index(&with_index)
        expect(a).to eq([])
      end
    end

    context "when called by a non-empty array" do
      it "returns the same array with a 'same' block" do
        b = zero123.my_each(&with_index)
        expect(b).to eq([0, 1, 2, 3])
      end
    end
  end

  describe "#my_select" do

    context "when called by an empty array" do
      it "returns an empty array" do
        a = empty.my_select(&even)
        expect(a).to eq([])
      end
    end

    context "when called by a non-empty array" do
      it "returns only the even numbers with an 'even?' block" do
        b = zero123.my_select(&even)
        expect(b).to eq([0, 2])
      end
    end
  end

  describe "#my_all?" do

    context "when called by an empty array" do
      it "returns true" do
        a = empty.my_all?(&even)
        expect(a).to be true
      end
    end

    context "when called by a non-empty array" do
      it "returns false with an 'even' block" do
        b = zero123.my_all?(&even)
        expect(b).to be false
      end
    end
  end

  describe "#my_any?" do

    context "when called by an empty array" do
      it "returns false" do
        a = empty.my_any?(&even)
        expect(a).to be false
      end
    end

    context "when called by a non-empty array" do
      it "returns true with an 'even' block" do
        b = zero123.my_any?(&even)
        expect(b).to be true
      end
    end
  end

  describe "#my_none?" do

    context "when called by an empty array" do
      it "returns true" do
        a = empty.my_none?(&even)
        expect(a).to be true
      end
    end

    context "when called by a non-empty array" do
      it "returns false with an 'even' block" do
        b = zero123.my_none?(&even)
        expect(b).to be false
      end
    end
  end

  describe "#my_count" do

    context "when called by an empty array" do
      it "returns zero" do
        a = empty.my_count
        expect(a).to eq(0)
      end
    end

    context "when called by a 4-element array" do
      it "returns four" do
        b = zero123.my_count
        expect(b).to eq(4)
      end
    end
  end

end
