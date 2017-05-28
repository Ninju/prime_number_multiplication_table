class Application
  def run
    prime_number_generator = PrimeNumberGenerator.new
    primes = prime_number_generator.take(10)

    multiplication_table = MultiplicationTable.new
    multiplication_table.populate(primes)

    puts multiplication_table
  end
end
