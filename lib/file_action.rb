class FileAction

  def initialize(output: $stdout, input: $stdin)
    @output = output
  end

  def count(file)
    count = 0
    open_file(file).each_entry do |line|
      count += line.chars.count
    end

    @output.puts(count)
  end

  def line(file)
    count = 0

    open_file(file).each_entry do |_line|
      count += 1
    end

    @output.puts(count)
  end


  def words(file)
    count = 0

    open_file(file).each_entry do |line|
      count += line.split(" ").count
    end

    @output.puts(count)
  end


  def byte_count(file)
    unless File.exist?(file)
      file_does_not_exist(file)
    end

    @output.puts(File.new(file).size)
  end

  private

  def open_file(file)
    if File.exist?(file)
      File.foreach(file)
    else
      file_does_not_exist(file)
    end
  end

  def file_does_not_exist(file)
    @output.puts("File does not exist #{file}")
    exit(1)
  end
end