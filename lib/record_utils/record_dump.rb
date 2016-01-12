# encoding: utf-8


module RecordUtils

  SERIALIZER =
  {
    :xml => :to_xml,
#    :csv => :to_csv, # not yet support
    :json => :to_json,
#    :yaml => :to_yaml # not yet support
  }

  class RecordDump < RecordBase

    def initialize
      super
    end

    def dump(type)
      if !SERIALIZER.include?(type)
        raise ArgumentError, "not support type #{type}"
      end
      # dump records
      models = get_models()
      maps = models.map do |m|
        SERIALIZER[type].to_proc.call(m.all)
      end

      write(type, maps)
    end

    def write(type, datas)
      filename = "dump/dump." + type.to_s
      File.open(filename, "w:utf-8") do |f|
        f.write(datas)
      end
    end
  end
end
