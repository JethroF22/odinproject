require "caesar"

describe "#caesar_cipher" do

  it "does not change an empty string" do
    empty = caesar_cipher('', 1)
    expect(empty).to eq('')
  end

  it "does not change numbers, spaces and special characters" do
    special = caesar_cipher('2112 -.--/-.--/--..', 1)
    expect(special).to eq('2112 -.--/-.--/--..')
  end

  it "does not change text when given a key of 0" do
    zero = caesar_cipher('Aeneadum genetrix hominum', 0)
    expect(zero).to eq('Aeneadum genetrix hominum')
  end

  it "correctly changes text with a key of 1" do
    one = caesar_cipher('Alma minha gentil que te partiste', 1)
    expect(one).to eq('Bmnb njoib hfoujm rvf uf qbsujtuf')
  end

  it "correctly ROT13s text" do
    rot13 = caesar_cipher("Use ROT26, it's twice as secure as ROT13!", 13)
    expect(rot13).to eq("Hfr EBG26, vg'f gjvpr nf frpher nf EBG13!")
  end
end
