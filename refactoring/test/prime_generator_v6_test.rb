require 'test/unit'
require 'lib/prime_generator_v6'

class GeneratePrimesTest < Test::Unit::TestCase

  def test_primes
    nil_array = PrimeGenerator.generate_primes(0)
    assert_equal 0, nil_array.size

    min_array = PrimeGenerator.generate_primes(2)
    assert_equal 1, min_array.size
    assert_equal 2, min_array[0]

    three_array = PrimeGenerator.generate_primes(3)
    assert_equal 2, three_array.size
    assert_equal 2, three_array[0]
    assert_equal 3, three_array[1]

    cent_array = PrimeGenerator.generate_primes(100)
    assert_equal 25, cent_array.size
    assert_equal 97, cent_array[24]
  end

  def test_exhaustive
    (2..500).each do |num|
      verify_prime_list PrimeGenerator.generate_primes(num)
    end
  end

  private

  def verify_prime_list(list)
    number_of_primes = list.length - 1
    (0..number_of_primes).each { |i| verify_prime(list[i]) }
  end

  def verify_prime(array_entry)
    factor = 2
    while (factor < array_entry) do
      assert factor%array_entry !=0
      factor = factor + 1
    end
  end
end
