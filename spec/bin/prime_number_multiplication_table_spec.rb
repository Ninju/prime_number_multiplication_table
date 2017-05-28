require 'spec_helper'

describe 'prime_number_multiplication_table' do
  subject { system("ruby -Ilib bin/#{self.class.description}") }

  # This is mostly for more useful error messages
  it "doesnt print anything out to stderr" do
    expect { subject }.to output('').to_stderr_from_any_process
  end

  include_examples :print_out_multiplication_table_of_first_ten_primes
end
