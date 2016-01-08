# encoding: utf-8
require_relative 'recordbase'

module RecordUtils

  class RecordDump < RecordBase

    def initialize
      super
    end

    def dump(adapter)
      if adapter == nil
        puts 'adapter null.'
        return
      end

      # dump records
      models = get_models()
      models.each do |model|
        # write use adapter
        adapter.output(model.all)
      end
    end

  end
end
