module PrimeNumberMultiplicationTable
  class PrimeNumberGenerator
    def initialize
      # important to have 2 & 3 because our algorithm assumes the last prime is
      # odd.. it also expects there to be at least one prime in the list
      @primes = [2,3]
    end

    def take(n)
      last_prime = primes.last

      if n > last_prime
        candidate = last_prime + 2

        while primes.size < n
          unless primes.any? { |prime_factor| (candidate % prime_factor).zero? }
            primes << candidate
          end

          # prime can't be even, unless it's '2'
          candidate += 2
        end
      end

      primes.take(n)
    end

    private

    attr_reader :primes
  end
end
