# frozen_string_literal: true

# This is top-level class documentation comment.
class HistogramGenerator
  def self.process_string(string:)
    if !string.empty?
      string.gsub(/[ ,.\r\n]/, ' ').split(' ').each_with_object(Hash.new(0)) do |word, result|
        result[word] += 1
      end
    else
      {}
    end
  end

  def self.sort_histogram(histogram)
    sort_histogram = ->(_word, occurencies) do occurencies; end
    histogram.sort_by { |word, occurencies| sort_histogram.call(word, occurencies) }.to_h
  end
end

# This is top-level module documentation comment.
module App
  TEXT = 'When Mr. and Mrs. Dursley woke up on the dull, gray Tuesday our story
starts, there was nothing about the cloudy sky outside to suggest that
strange and mysterious things would soon be happening all over the
country. Mr. Dursley hummed as he picked out his most boring tie for
work, and Mrs. Dursley gossiped away happily as she wrestled a screaming
Dudley into his high chair.'

  NUMBERS_IN_WORDS = {
    1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine'
  }.freeze

  module_function

  def perform
    text = ''
    puts('reading file')
    puts("extracted string: #{text}")
    histogram = HistogramGenerator.process_string(string: TEXT)
    puts('generated histogram:')
    puts(histogram)
    puts('sorted histogram:')
    puts(HistogramGenerator.sort_histogram(histogram))
  end

  def number_to_word(number)
    NUMBERS_IN_WORDS[number] || 'oops'
  end
end

puts App.perform
[1, 2, 3, 4, 5, 6, 7, 8, 9, 13_666].each do |number|
  puts App.number_to_word(number)
end
