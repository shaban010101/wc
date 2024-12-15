require 'optparse'
require_relative 'file_action'

class Parser
  OPTIONS = {
    '-c' => "--count",
    '-l' => "--line",
    '-w' => "--words",
    '-m' => "multibyte"
  }

  def parse(options)
    if !OPTIONS.keys.include?(options.first)
      "#{file_action.line(options.first)} #{file_action.words(options.first)} #{file_action.byte_count(options.first)} "
    end

    OptionParser.new do |opts|
      opts.banner = "Usage: wcp [options]"

      opts.on("-c", "--count file", "File byte count") do |file|
        "#{file_action.count(file)} #{File.basename(file)}"
      end

      opts.on("-l", "--line file", "File line count") do |file|
        "#{file_action.line(file)} #{File.basename(file)}"
      end

      opts.on("-w", "--words file", "File line count") do |file|
        "#{file_action.words(file)} #{File.basename(file)}"
      end

      opts.on("-m", "--multibyte file", "File multibyte count") do |file|
        "#{file_action.byte_count(file)} #{File.basename(file)}"
      end
    end.parse!(options)
  end

  def file_action
    @file_action ||= FileAction.new
  end
end