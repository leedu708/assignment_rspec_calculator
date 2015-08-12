# Your code here

require 'calculator'

describe Calculator do
  let(:c){ Calculator.new }

  it "initialization actually makes a calculator" do
    expect(c).to be_a(Calculator)
  end

  it "properly adds numbers together" do
    expect(c.add(1,2)).to eq(3)
  end

  it "properly subtracts two numbers" do
    expect(c.subtract(1,2)).to eq(-1)
  end

  it "properly multiplies two numbers together" do
    expect(c.multiply(2,3)).to eq(6)
  end

  it "properly divides two numbers and returns float" do
    expect(c.divide(2,3)).to eq(2.0 / 3.0)
  end

  it "properly outputs an int when division of two numbers is an int" do
    expect(c.divide(4,2)).to eq(2)
  end

  it "properly computes exponents" do
    expect(c.pow(3,3)).to eq(27.0)
  end

  it "properly computes exponents that are fractions" do
    expect(c.pow(27,1 / 3.0)).to eq(3.0)
  end

  it "properly computes the square root of a perfect square" do
    expect(c.sqrt(9)).to eq(3)
  end

  it "properly computes the square root of a number" do
    expect(c.sqrt(8)).to eq(2.83)
  end

  describe '#memory' do

    it "properly returns 'nil' when no object is stored in memory" do
      expect(c.memory).to eq(nil)
    end

    it "properly returns the value of an object stored in memory" do
      expect(c.memory=(8)).to eq(8)
    end

    it "properly returns the same value after an object has been stored in memory" do
      c.memory=(8)
      expect(c.memory).to eq(8)
    end

    it "properly clears memory" do
      c.memory=(8)
      c.memory
      expect(c.memory).to eq(nil)
    end

  end

  describe '#stringify' do
    let(:c2){ Calculator.new(true) }

    it "allows initialization of second calculator" do
      expect(c2).to be_a(Calculator)
    end

    it "returns a string after using the add fucntion" do
      expect(c2.add(1,2)).to eq("3")
    end
  end



end