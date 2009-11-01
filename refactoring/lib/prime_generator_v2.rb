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
      initialize_sieve max_value
      sieve
      load_primes
      return @primes
    end
  end

  def self.load_primes
    # how many primes are there?
    count = 0
    i = 0
    while i < @s
      if @f[i]
        count = count + 1
      end
      i = i + 1
    end
    @primes = Array.new(count)
    
    # move the primes into the result
    i = 0
    j = 0
    while i < @s
      if @f[i]
        @primes[j] = i
        j = j + 1
      end
    i = i + 1
    end
  end

  def self.sieve
    i = 2
    while(i < (Math.sqrt(@s) + 1))
      if @f[i] # if i is uncrossed, cross its multiples
        j = 2 * i
        while j < @s
          @f[j] = false # multiple is not prime 
          j = j + i
        end
      end
      i = i + 1
    end
  end

  def self.initialize_sieve(max_value)
    # declarations
    @s = max_value + 1 # size of array
    @f = Array.new(@s) { true } #initialize array to true

    # get rid of known non-primes
    @f[0] = @f[1] = false
  end
end
