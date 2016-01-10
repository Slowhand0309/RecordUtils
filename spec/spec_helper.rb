# encoding: utf-8
require_relative '../lib/record_utils'

RSpec.configure do |config|
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
