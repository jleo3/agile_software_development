require 'test/unit'
require 'lib/prime_generator_v5'

class GeneratePrimesTest < Test::Unit::TestCase

  def test_primes
    null_array = PrimeGenerator.generate_primes(0)
    assert_equal 0, null_array.size

    min_array = PrimeGenerator.generate_primes(2)
    assert_equal 1, min_array.size
    assert_equal 2, min_array[0]

    three_array = PrimeGenerator.generate_primes(3)
    assert_equal 2, three_array.size
    assert_equal 2, three_array[0]
    assert_equal 3, three_array[1]
  end

  def test_big_prime
    cent_array = PrimeGenerator.generate_primes(100)
    assert_equal 25, cent_array.size
    assert_equal 97, cent_array[24]
  end
end
