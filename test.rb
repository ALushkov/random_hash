class Generator

  CHR_INDENT = 65
  ALPHABET_SIZE = 26
  CHR_RANDOM_LENGTH = 5
  RANDOM_HASH_OPTIONS = 3
  MAX_HASH_LENGTH = 5
  MAX_NUMBER_VALUES = 1000

  def initialize
    @number = 0
  end

  #вывод хеша
  def print_hash(hash = generate_hash, i = 0)
    print '{'
    hash.each_pair do |key, value|
      puts "#{' '*i}'#{key}' => #{(value.is_a?(Hash) ? '{' : value.to_s) }#{(value.is_a?(Hash) ? '' : ',')}"
      print_hash(value, i + 2) if value.is_a?(Hash)
      puts "#{' '*i}}," if value.is_a?(Hash)
    end
    print '}'
  end


  private

  #генерация рандомного символа
  def rand_string
    @number += 1
    (0..(rand(CHR_RANDOM_LENGTH) + 1)).map { (CHR_INDENT + rand(ALPHABET_SIZE)).chr }.join.to_sym
  end

  #генерация рандомного варианта для значения хеша
  def rand_option
    rand(RANDOM_HASH_OPTIONS )
  end

  #генерация хеша
  def generate_hash
    step = 0
    result_hash = {}
    until (step > rand(MAX_HASH_LENGTH)) && (@number < MAX_NUMBER_VALUES)
    case rand_option
    when 1
      random_value = rand(100)
    when 2
      random_value = nil
    else
      random_value = Hash[generate_hash]
    end
    result_hash[rand_string] = random_value
    step += 1
    end
    result_hash
  end

end

Generator.new.print_hash