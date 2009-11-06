# This class generates prime numbers up to a user-specified
# maximum.  The algorithm used is the Sieve of Eratosthenes.
# Given an array of integers starting at 2:  
# Find the first uncrossed integer, and cross out all its 
# multiples.  Repeat until the first uncrossed integer exceeds
# the square root of the maximum value.

class PrimeGenerator

  def self.generate_primes(max_value)
    if max_value < 2
      return [];
    else
      initialize_array_of_integers max_value
      cross_out_multiples
      put_uncrossed_integers_into_result
      return @result
    end
  end

  def self.put_uncrossed_integers_into_result
    @result = Array.new(number_of_uncrossed_integers)
    i = 0
    j = 0
    while i < @is_crossed.length
      if not_crossed(i)
        @result[j] = i
        j = j + 1
      end
    i = i + 1
    end
  end

  def self.number_of_uncrossed_integers
    count = 0
    i = 0
    while i < @is_crossed.length
      if not_crossed(i)
        count = count + 1
      end
      i = i + 1
    end
    count
  end

  def self.cross_out_multiples
    max_prime_factor = calc_max_prime_factor
    i = 2
    while i <= max_prime_factor
      if not_crossed(i)
        cross_out_multiples_of i
      end
      i = i + 1
    end
  end

  def self.calc_max_prime_factor
    # We cross out all multiples of p, where p is prime.
    # Thus, all crossed out multiples have p and q for
    # factors.  If p > sqrt of the size of the array, then
    # q will never be greater than 1.  Thus p is the 
    # largest prime factor in the array, and is also
    # the iteration limit.
    max_prime_factor = Math.sqrt(@is_crossed.length) + 1
    max_prime_factor.to_i
  end
  
  def self.cross_out_multiples_of(i)
    multiple = 2 * i
    while multiple < @is_crossed.length
      @is_crossed[multiple] = true
      multiple = multiple + i
    end
  end

  def self.not_crossed(i)
    @is_crossed[i] == false
  end

  def self.initialize_array_of_integers(max_value)
    @is_crossed = Array.new(max_value + 1) { true }
    i = 2
    while i < @is_crossed.length
      @is_crossed[i] = false
      i = i + 1
    end
  end
end
