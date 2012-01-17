# encoding: utf-8
require 'rake/testtask'

Rake::TestTask.new(:spec) do |test|
  test.libs << 'lib' << 'spec'
  test.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec
