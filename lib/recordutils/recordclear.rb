# encoding: utf-8
require_relative 'recordbase'

module RecordUtils
  class RecordClear < RecordBase

    def initialize
      super
    end

    def clear_all
      models = get_models()
      models.each do |model|
        model.delete_all
      end
    end

    def clear(table_name)
      clear([table_name])
    end

    def clear(table_names)
      models = get_models()
      models.each do |model|
        if table_names.include?(model.table_name)
          model.delete_all
        end
      end
    end
  end
end
