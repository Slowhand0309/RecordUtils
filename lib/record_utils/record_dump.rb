# encoding: utf-8


module RecordUtils

  SERIALIZER =
  {
    :xml => :to_xml,
#    :csv => :to_csv, # not yet support
    :json => :to_json,
    :yaml => :to_yaml
  }

  class RecordDump < RecordBase

    def initialize
      super
    end

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

    private
    def write(filename, type, datas)
      File.open(filename, "w:utf-8") do |f|
        f.write(datas)
      end
    end
  end
end
