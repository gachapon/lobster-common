require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'yard'

RSpec::Core::RakeTask.new(:spec)
task :test => :spec

YARD::Rake::YardocTask.new do |t|
  t.files = %w(lib/**/*.rb - *.md)
end
task :doc => :yard
