require 'spec_helper'

describe Application do
  describe "#run" do
    subject { described_class.new.run }
    include_examples :print_out_multiplication_table_of_first_ten_primes
  end
end
