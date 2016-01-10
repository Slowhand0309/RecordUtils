# encoding: utf-8
require 'active_support'

module RecordUtils
  extend ActiveSupport::Autoload

  autoload :RecordBase
  autoload :RecordClear
  autoload :RecordDump
end
