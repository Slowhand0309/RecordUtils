# encoding: utf-8
require 'record_utils/ext/csv.rb'

module RecordUtils

  SERIALIZER =
  {
    :xml => :to_xml,
    :csv => :to_csv,
    :json => :to_json,
    :yaml => :to_yaml
  }

  module RecordDump

    def dump(filename, type = :json)
      if !SERIALIZER.include?(type)
        raise ArgumentError, "not support type #{type}"
      end
      # dump records
      models = get_models()
      maps = models.map do |m|
        SERIALIZER[type].to_proc.call(m.all)
      end

      write(filename, type, maps)
    end

    def write(filename, type, datas)
      File.open(filename, "w:utf-8") do |f|
        f.write(datas)
      end
    end
  end
end
