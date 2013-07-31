require "bundler/gem_tasks"
require 'rspec/core/rake_task'

# Spec-related tasks
RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = true
end

task :default do
  puts `ruby main.rb --help`
end
