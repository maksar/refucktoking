require 'cucumber/rake/task'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

Cucumber::Rake::Task.new(:cucumber)

desc "Run Cucumber & MiniTest to generate aggregated coverage"
task :default do
  FileUtils.rm_rf('coverage')

  Rake::Task['test'].invoke
  Rake::Task["cucumber"].invoke
end