require 'minitest/unit'
require 'minitest/autorun'
require 'simplecov'

require 'simplecov-rcov-text'

class TestSimpleCovFormatterRcovTextFormatter < MiniTest::Unit::TestCase
  def setup
    @rcov_file = File.join( SimpleCov::Formatter::RcovTextFormatter.output_path, SimpleCov::Formatter::RcovTextFormatter.file_name)
    @result = SimpleCov::Result.new(
      {
        File.expand_path( File.join( File.dirname( __FILE__ ), 'fixtures', 'some_class.rb' ) )  =>
        [1,1,1,1,nil,1,0,1,1]
      }
    )
  end

  def test_format
    if File.exists?( @rcov_file )
      File.delete( @rcov_file )
    end

    SimpleCov::Formatter::RcovTextFormatter.new.format( @result )

    assert File.exists?( @rcov_file )
  end

  def test_create_content
    content = SimpleCov::Formatter::RcovTextFormatter.new.create_content( @result )
    test = "\="*80

    assert_match /#{test}/,content
    assert_match /!!     value \* value/,content
  end
end