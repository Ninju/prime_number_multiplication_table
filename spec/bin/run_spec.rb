require 'spec_helper'

describe 'run.rb' do
  subject { system("bundle exec ruby bin/run.rb") }

  include_examples :print_out_multiplication_table_of_first_ten_primes
end
