#!/usr/bin/env ruby
require 'optparse'
require 'life'

options = {
  pattern: nil,
  delay: 1,
  spaces: 1,
  lines: 1,
  verbose: false
}

patterns = Life::PatternLoader.patterns
parser = OptionParser.new do |o|
  o.on('-p', '--pattern PATTERN',
    # patterns,
    'Pattern to create first generation',
    "Possible patterns: #{patterns.join(', ')}"
  ) do |arg|
    options[:pattern] = arg
  end

  o.on('-d', '--delay SECONDS',
    OptionParser::DecimalNumeric,
    'Number of seconds between two generation'
  ) do |arg|
    options[:delay] = arg
  end

  o.on('-s', '--spaces N',
    OptionParser::DecimalNumeric,
    'Number of spaces between two cells'
  ) do |arg|
    options[:spaces] = arg
  end

  o.on('-l', '--lines N',
    OptionParser::DecimalNumeric,
    'Number of lines between two rows'
  ) do |arg|
    options[:lines] = arg
  end

  o.on '-v', '--verbose', 'Run verbosely' do
    options[:verbose] = true
  end
end
parser.banner = 'Usage: life.rb [options]'
parser.on_tail '-h', '--help', 'Show help' do
  puts parser
  exit 1
end
parser.parse!

pattern_name = options.delete(:pattern)
first_generation = Life::PatternLoader.pattern(pattern_name)

game = Life::Game.new(first_generation, options)
game.run()
