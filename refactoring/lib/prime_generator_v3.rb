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
    # how many primes are there?
    count = 0
    i = 0
    while i < @f.length
      if @f[i]
        count = count + 1
      end
      i = i + 1
    end
    @result = Array.new(count)
    
    # move the primes into the result
    i = 0
    j = 0
    while i < @f.length
      if @f[i]
        @result[j] = i
        j = j + 1
      end
    i = i + 1
    end
  end

  def self.cross_out_multiples
    i = 2
    while(i < (Math.sqrt(@f.length) + 1))
      if @f[i] # if i is uncrossed, cross its multiples
        j = 2 * i
        while j < @f.length
          @f[j] = false # multiple is not prime 
          j = j + i
        end
      end
      i = i + 1
    end
  end

  def self.initialize_array_of_integers(max_value)
    @f = Array.new(max_value + 1) { true } #initialize array to true
    @f[0] = @f[1] = false # neither primes nor multiples
  end
end
