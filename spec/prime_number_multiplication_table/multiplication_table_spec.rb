require 'spec_helper'

RSpec.describe PrimeNumberMultiplicationTable::MultiplicationTable do
  subject { described_class.new }

  it "populates a multiplication table for the given factors" do
    subject.populate([2,3])
    expect(subject.get(0,0)).to eq(4)
    expect(subject.get(0,1)).to eq(6)
    expect(subject.get(1,0)).to eq(6)
    expect(subject.get(1,1)).to eq(9)
  end

  it "renders the multiplication table as a string in an easy to read format" do
    subject.populate([1,2,3,4])
    expect(subject.to_s).to eq(%q{
                                +---+---+---+----+----+
                                |   | 1 | 2 | 3  | 4  |
                                +---+---+---+----+----+
                                | 1 | 1 | 2 | 3  | 4  |
                                +---+---+---+----+----+
                                | 2 | 2 | 4 | 6  | 8  |
                                +---+---+---+----+----+
                                | 3 | 3 | 6 | 9  | 12 |
                                +---+---+---+----+----+
                                | 4 | 4 | 8 | 12 | 16 |
                                +---+---+---+----+----+
                               }.strip_between_newlines)
  end
end
