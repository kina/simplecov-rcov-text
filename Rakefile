require 'bundler'
require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/test_*.rb"
end

task :default => :test
