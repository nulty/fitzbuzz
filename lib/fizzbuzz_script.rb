class FizzbuzzScript
  FIZZ     = 'fizz'.freeze
  BUZZ     = 'buzz'.freeze
  FIZZBUZZ = 'fizzbuzz'.freeze

  def self.call(n)
    if n % 15 == 0 then FIZZBUZZ
    elsif n % 5 == 0 then BUZZ
    elsif n % 3 == 0 then FIZZ
    else
      n
    end
  end
end
