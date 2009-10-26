# This class gneerates prime numbers up to a user-specified
# maximum.  The algorithm used is the Sieve of Eratosthenes.
# <p>
# Eratosthenes of Cyrene, b. c. 276 BC, Cyrene, Libya --
# d. c. 194, Alexandria.  The first man to calculate the
# circumference of the Earth.  Also known for working on
# calendars with leap years, he ran the library at Alexandria.
# <p>
# The algorithm is quite simple.  Given an array of integers
# starting at 2.  Cross out all multiples of 2.  Find the next
# uncrossed integer, and cross out all of its multiples.
# Repeat until you have passed the square root of the maximum
# value.
#
# @author Robert C. Martin
# @version 9 Dec 1999 rcm

class GeneratePrimes

  def self.generate_primes(maxValue)
    if maxValue >= 2 # the only valid case
      # declarations
      s = maxValue + 1 # size of array
      f = Array.new(s) { true } #initialize array to true

      # get rid of known non-primes
      f[0] = f[1] = false

      # sieve
      i = 2
      while(i < (Math.sqrt(s) + 1))
        if f[i] # if i is uncrossed, cross its multiples
          j = 2 * i
          while j < s
            f[j] = false # multiple is not prime 
            j = j + i
          end
        end
        i = i + 1
      end

      # how many primes are there?
      count = 0
      i = 0
      while i < s
        if f[i]
          count = count + 1
        end
        i = i + 1
      end
      primes = Array.new(count)
      
      # move the primes into the result
      i = 0
      j = 0
      while i < s
        if f[i]
          primes[j] = i
          j = j + 1
        end
      i = i + 1
      end
      
      return primes # return the primes
    else
      return []
    end
  end
end
