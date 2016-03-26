require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rubocop'
require 'rubocop/formatter/checkstyle_formatter'
require 'rspec/core/rake_task'
require 'yard'

task :default => [:build, :test]
task :inspect => [:rubocop]
task :reports => [:rubocop_xml]

RSpec::Core::RakeTask.new(:spec)
task :test => :spec

RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  task.fail_on_error = false
end
RuboCop::RakeTask.new(:rubocop_xml) do |task|
  task.patterns = ['lib/**/*.rb']
  task.fail_on_error = false
  task.formatters << 'RuboCop::Formatter::CheckstyleFormatter'
  task.options << %w(--out rubocop.xml)
end

YARD::Rake::YardocTask.new do |task|
  task.files = %w(lib/**/*.rb - *.md)
end
task :doc => :yard
