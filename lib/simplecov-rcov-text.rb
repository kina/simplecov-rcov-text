require 'cgi'
require 'fileutils'
require 'time'

unless defined?(SimpleCov)
  raise RuntimeError, "simplecov-rcov-text is a formatter for simplecov. Please update your test helper and gemfile to require 'simplecov'!"
end

class SimpleCov::Formatter::RcovTextFormatter
  def format( result )
    FileUtils.mkdir_p(SimpleCov::Formatter::RcovTextFormatter.output_path)

    File.open(File.join(SimpleCov::Formatter::RcovTextFormatter.output_path, SimpleCov::Formatter::RcovTextFormatter.file_name), "wb+") do |rcov|
      rcov << create_content(result)
    end
  end

  def create_content(result)
    content = "metric_fu shift the first line\n"
    result.source_files.each do |source_file|
      content << "=" * 80
      content << "\n #{simple_file_name(source_file)}\n"
      content << "=" * 80
      content << "\n"
      source_file.lines.each do |line|
        content << (line.missed? ? '!!'  : '  ')
        content << " #{line.src.chomp}\n"
      end
      content << "\n"
    end
    content
  end

  def simple_file_name(source_file)
    source_file.filename.gsub(SimpleCov.root, '.')
  end

  def self.file_name
    "rcov.txt"
  end

  def self.output_path
    File.join( SimpleCov.coverage_path, "/rcov" )
  end
end
