require "bundler/gem_tasks"
require 'rspec/core/rake_task'

# Spec-related tasks
RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = true
end

task :default do
  puts `ruby main.rb --help`
end

desc "Task used for the continuous integration"
task :ci => [:build, :spec]

desc "Static analysis tasks"
namespace :static_analysis do

  desc "Check if the travis configuration is correct"
  task :check_travis do
    puts `bundle exec travis-lint`
  end

end
