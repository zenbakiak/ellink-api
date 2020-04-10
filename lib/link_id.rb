# frozen_string_literal: true

# Basically we're using a permutation of an alphabet including uppercase,
# lowercase and numbers the formula is nPr where n = 62 and r = 7
# 62! / (62-7)! = 2.478652606E+12, = 2478652606080 possible ids.

# Of course we can use a more sofisticated technic
# like Hashids which uses a variation of the Fisher-Yates shuffle algorithm
# https://hashids.org/
# https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle

class LinkId
  DICTIONARY = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
  DICTIONARY_LEN = DICTIONARY.size

  # we can reduce the length of the generated code by removing zeros in the value
  # but the less zeros we had, the more collision possibilities.
  def self.generate
    value = (Time.now.to_f * 1000).to_i
    code = ''

    chars = DICTIONARY.split('').shuffle.join('')

    loop do
      code = chars[value % DICTIONARY_LEN] + code
      value /= DICTIONARY_LEN
      break unless value.positive?
    end

    code
  end
end
