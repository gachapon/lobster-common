require 'bundler/gem_tasks'
require 'reek/rake/task'
require 'rubocop/rake_task'
require 'rubocop'
require 'rubocop/formatter/checkstyle_formatter'
require 'rspec/core/rake_task'
require 'yard'

task :default => [:build, :test]
task :inspect => [:reek, :rubocop]
task :reports => [:reek_xml, :rubocop_xml]

RSpec::Core::RakeTask.new(:spec)
task :test => :spec

Reek::Rake::Task.new do |task|
  task.name = :reek
  task.source_files = 'lib/**/*.rb'
  task.fail_on_error = false
end
Reek::Rake::Task.new do |task|
  task.name = :reek_xml_stdout
  task.source_files = 'lib/**/*.rb'
  task.reek_opts = '--format xml'
  task.fail_on_error = false
end
# Reek dumps to STDOUT, so this task redirects it to a file.
task :reek_xml do
  sh 'rake reek_xml_stdout > reek.xml'
end

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
