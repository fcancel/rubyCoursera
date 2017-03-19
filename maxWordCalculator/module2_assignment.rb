class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number
  @word_frequency_map

  def initialize (line_content, line_number)
    @content = line_content
    @line_number = line_number

    calculate_word_frequency
  end

  def calculate_word_frequency
    get_highest_word_frequency_count
    get_highest_word_frequency_words
  end


  private
  def get_highest_word_frequency_count
    construct_word_map

    @highest_wf_count = get_max_frequency(@word_frequency_map)
  end

  private
  def construct_word_map
    @word_frequency_map = Hash.new(0)
    @content.split.each do |word|
      @word_frequency_map[word.downcase] +=1
    end
  end

  private
  def get_max_frequency(words_with_frequency)
    a = words_with_frequency.max_by{|key,value| value}[1]
  end

  private
  def get_highest_word_frequency_words
    @highest_wf_words = []
    @word_frequency_map.each do |key, value|
      if value.equal?(@highest_wf_count)
        @highest_wf_words << key
      end
    end
  end

end



class Solution
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines

  def initialize
    @analyzers = []
  end

  def analyze_file
    File.foreach('test.txt').with_index do |line, index|
      @analyzers << LineAnalyzer.new(line, index)
    end
  end


  def calculate_line_with_highest_frequency
    calculate_highest_count_across_lines
    calculate_highest_count_words_across_lines
  end


  def print_highest_word_frequency_across_lines
    p 'The following words have the highest word frequency per line:'
    @highest_count_words_across_lines.each do |line_analyzer_object|
      p "#{line_analyzer_object.highest_wf_words.to_s.gsub(/"/, '')}  (appears in line ##{line_analyzer_object.line_number})"
    end
  end

  private
  def calculate_highest_count_across_lines
    @highest_count_across_lines = 0
    @analyzers.each do |line_analyzer_object|
      if line_analyzer_object.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = line_analyzer_object.highest_wf_count
      end
    end
  end

  private
  def calculate_highest_count_words_across_lines
    @highest_count_words_across_lines = []
    @analyzers.each do |line_analyzer_object|
      if line_analyzer_object.highest_wf_count.equal?(@highest_count_across_lines)
        @highest_count_words_across_lines << line_analyzer_object
      end
    end
  end
end
