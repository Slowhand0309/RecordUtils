# encoding: utf-8
require 'yaml'
require 'logger'
require 'mysql2'
require 'active_record'

module RecordUtils
  class RecordBase

    CONFIG_YML = 'config/database.yml'
    DB_ENV = 'development'

    def initialize
    end

    def connect(yml_path = nil)

      yml_path ||= CONFIG_YML
      config = YAML.load_file(yml_path)
      if config != nil
        env = ENV["RAILS_ENV"]
        env ||= DB_ENV
        begin
          ActiveRecord::Base.establish_connection(config["development"])
          ActiveRecord::Base.logger = Logger.new(STDOUT)
        rescue => e
          $stderr.puts 'connection adapter invalid.'
        end
      end
    end

    def get_records
      tables =  ActiveRecord::Base.connection.tables
      models = Array.new
      tables.each do |table|
        cls = self.class.const_set(table.classify, Class.new(ActiveRecord::Base))
        cls.table_name = table
        models << cls
      end
      return models
    end
  end
end
