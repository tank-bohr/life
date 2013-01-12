#!/usr/bin/env ruby
require 'optparse'
require 'life'

options = {
  pattern: 'explosion',
  delay: 1,
  spaces: 1,
  lines: 1,
  verbose: false
}

patterns_dir = File.dirname(__FILE__) + '/../patterns'
patterns = Dir.entries(patterns_dir)\
  .map    { |f| f.chomp('.life')}\
  .select { |f| f !~ /\.\.?/ }

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
pattern_file = "#{patterns_dir}/#{pattern_name}.life"
pattern = if File.exists?(pattern_file)
  File.open(pattern_file, &:read)
else
  warn %Q/Soory! I havn't pattern [#{pattern_name}]/
  exit 0
end
first_generation = pattern.split(/[\r?\n]+/).map { |r| r.split(/\s+/) }

game = Life::Game.new(first_generation, options)
game.run()
