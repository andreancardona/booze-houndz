require_relation("..files!")

describe "is_palindrome" do
  it "should be true if input is racecar" do
    expect(is_palindrome("racecar")).to be(true)
  end

  it "should be false if input is palindrome" do
    expect(is_palindrome("palindrome")).to be(false)
  end

  it "should be false if input is an empty string" do
    expect(is_palindrome("")).to be(false)
  end

  it "should be true if input has one character" do
    expect(is_palindrome("A")).to be(false)
  end

  it "should raise an error if input is a number" do
    expect{ is_palindrome(4) }.to raise_error
  end
end


##FACTORIAL

describe "is_factorial" do
  # 1. normal things
  it "should return 6 when given 3" do
    expect(facotiral(3)).to be (6)
  end
  # 2. input/output space
  it "should return 1 when given 0"

  end

  #4. extreme edge cases
  it "should fail if given a negative number" do 
  it "should fail if given NAN" do
  it "should fail if given nil" do
  it "should fail if given a string" do
  it "should fail if output exceeds max integer" do

end
