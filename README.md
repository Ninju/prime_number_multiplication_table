# Prime Number Multiplication Table

Prints out a multiplication table for the first 10 prime numbers.

## Running instructions

The code is packaged as a gem. Clone the repo and build it using:

`gem build prime_number_multiplication_table.gem`

And then install:

`gem install prime_number_multiplication_table-0.0.1.gem`

This will install an executable named `prime_number_multiplication_table` which runs the program. Alternatively, you can use the gem by requiring `'prime_number_multiplication_table'` in your code/IRB session and using it. `PrimeNumberMultiplicationTable::Application.new.run` will output a multiplication table for the first 10 primes.

## If the gem package fails

Unfortunately, it seems the gem package has broken and so the above instructions may not work.

In that case, you may clone the repo and run `ruby -Ilib ./bin/prime_number_multiplication_table` which should work.

## Method

I'm using the 'Sieve of eratosthenes' to generate the primes.
