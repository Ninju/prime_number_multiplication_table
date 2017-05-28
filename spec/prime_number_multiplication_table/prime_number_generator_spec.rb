require 'spec_helper'

RSpec.describe PrimeNumberMultiplicationTable::PrimeNumberGenerator do
  subject { described_class.new }

  it 'gives the first N prime numbers in ascending order' do
    expect(subject.take(5)).to match_array([2,3,5,7,11])
  end
end
