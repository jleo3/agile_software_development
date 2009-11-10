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
      cross_out_integers_up_to max_value
      cross_out_multiples
      put_uncrossed_integers_into_result
      return @result
    end
  end

  def self.put_uncrossed_integers_into_result
    @result = Array.new(number_of_uncrossed_integers)
    i = 0
    j = 0
    while i < @crossed_out.length
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
    while i < @crossed_out.length
      if not_crossed(i)
        count = count + 1
      end
      i = i + 1
    end
    count
  end

  def self.cross_out_multiples
    max_prime_factor = determine_iteration_limit
    i = 2
    while i <= max_prime_factor
      if not_crossed(i)
        cross_out_multiples_of i
      end
      i = i + 1
    end
  end

  def self.determine_iteration_limit
    # Every multiple in the array has a prime factor that
    # is less than or equal to the sqrt of the array size,
    # so we don't have to cross out multiples of numbers
    # larger than the root.
    iteration_limit = Math.sqrt(@crossed_out.length);
    iteration_limit.to_i
  end
  
  def self.cross_out_multiples_of(i)
    multiple = 2 * i
    while multiple < @crossed_out.length
      @crossed_out[multiple] = true
      multiple = multiple + i
    end
  end

  def self.not_crossed(i)
    @crossed_out[i] == false
  end

  def self.cross_out_integers_up_to(max_value)
    @crossed_out = Array.new(max_value + 1) { true }
    i = 2
    while i < @crossed_out.length
      @crossed_out[i] = false
      i = i + 1
    end
  end
end
