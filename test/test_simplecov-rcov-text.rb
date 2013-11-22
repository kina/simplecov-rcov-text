require 'minitest'
require 'minitest/autorun'
require 'minitest/unit'
require 'simplecov'

require 'simplecov-rcov-text'

class TestSimpleCovFormatterRcovTextFormatter < MiniTest::Test
  def setup
    @rcov_file = File.join( SimpleCov::Formatter::RcovTextFormatter.output_path, SimpleCov::Formatter::RcovTextFormatter.file_name)
    File.delete( @rcov_file ) if File.exists?( @rcov_file )

    @result = SimpleCov::Result.new(
      {
        File.expand_path( File.join( File.dirname( __FILE__ ), 'fixtures', 'some_class.rb' ) )  =>
        [1,1,1,1,nil,1,0,1,1,nil,0,1,1]
      }
    )

    # Set to default encoding
    Encoding.default_internal = nil if defined?(Encoding)
  end

  def test_format
    SimpleCov::Formatter::RcovTextFormatter.new.format( @result )

    assert File.exists?( @rcov_file )
  end

  def test_encoding
    # This is done in many rails environments
    Encoding.default_internal = 'UTF-8' if defined?(Encoding)

    SimpleCov::Formatter::RcovTextFormatter.new.format( @result )
  end

  def test_create_content
    content = SimpleCov::Formatter::RcovTextFormatter.new.create_content( @result )
    test = "\="*80

    assert_match(/#{test}/, content)
    assert_match(/!!     value \* value/, content)
  end
end
