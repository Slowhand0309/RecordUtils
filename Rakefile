# coding: utf-8
require_relative 'lib/recordutils'

task :test do
  r = RecordUtils::RecordBase.new
  r.connect
  p r.get_models
  p r.get_models
end

task :clear do
  r = RecordUtils::RecordClear.new
  r.connect
  r.clear_all
end
