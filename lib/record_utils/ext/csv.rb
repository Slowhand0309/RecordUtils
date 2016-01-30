# encoding: utf-8

module ActiveSupport
  module CSV
    def self.encode(obj)
      puts "self.encode"
    end
  end

  module ToCsvWithActiveSupportEncoder # :nodoc:
    def to_csv(options = nil)
      puts "to_csv"
      ActiveSupport::CSV.encode(self)
    end
  end
end

[Object, Array, FalseClass, Float, Hash, Integer, NilClass, String, TrueClass, Enumerable].reverse_each do |klass|
  klass.prepend(ActiveSupport::ToCsvWithActiveSupportEncoder)
end
