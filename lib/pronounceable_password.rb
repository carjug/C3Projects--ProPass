require 'csv'
require 'pry'

class PronounceablePassword
  attr_reader :data

  def initialize(probability_corpus)
    # probability corpus is the file location of the CSV with the
    # pre-calculated letter probability pairs
    @probability_corpus = probability_corpus
  end

  def read_probabilities
    # Should consume the provided CSV file into a structure that
    # can be used to identify the most probably next letter
    @data = {}

    CSV.foreach(@probability_corpus, headers: true, header_converters: :symbol) do |row|
      @data[row[:letter_pair]] = row[:count].to_i
    end

    return @data
  end

  def possible_next_letters(letter)
    # Should return an array of possible next letters sorted
    # by likelyhood in a descending order
    all_matches = @data.select { |key| key[0].include?(letter) }

    sorted_letters = all_matches.sort_by { |key, values| -values }
  end

  def most_common_next_letter(letter)
    # The most probable next letter
  end

  def common_next_letter(letter, sample_limit = 2)
    # Randomly select a common letter within a range defined by
    # the sample limit as the lower bounds of a substring
  end
end
