# coding: utf-8
#require 'active_support/dependencies.rb'
#ActiveSupport::Dependencies.autoload_paths << 'lib'
require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end

task default: :spec
