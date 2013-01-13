# encoding: utf-8

module Life
  module PatternLoader
    extend self
    @@patterns_dir = File.dirname(__FILE__) + '/../../patterns'

    def patterns
      @@patterns ||= Dir.entries(@@patterns_dir)\
        .map    { |f| f.chomp('.life')}\
        .select { |f| f !~ /\.\.?/ }
    end

    def load_pattern(pattern_name = nil)
      if pattern_name.nil?
        pattern_name = patterns.sample
      end
      pattern_file = "#{@@patterns_dir}/#{pattern_name}.life"
      pattern = if File.exists?(pattern_file)
        File.open(pattern_file, &:read)
      else
        raise %Q/Soory! I havn't pattern [#{pattern_name}]/
      end
    end

    def pattern(pattern_name = nil)
      pattern = load_pattern(pattern_name)
      pattern.split(/[\r?\n]+/).map { |r| r.split(/\s+/) }
    end
  end
end
