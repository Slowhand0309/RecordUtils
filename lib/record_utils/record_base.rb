# encoding: utf-8
require 'yaml'
require 'logger'
require 'mysql2'
require 'active_record'
require 'active_support/cache'

module RecordUtils
  class RecordBase

    CONFIG_YML = 'config/database.yml'
    DB_ENV = 'development'
    MEMORY_STORE_KEY = 'models'

    def initialize
      @cahce = ActiveSupport::Cache::MemoryStore.new
    end

    def connect(yml_path = nil)

      yml_path ||= CONFIG_YML
      config = YAML.load_file(yml_path)
      if config != nil
        env = ENV["RAILS_ENV"]
        env ||= DB_ENV
        begin
          ActiveRecord::Base.establish_connection(config[env])
          ActiveRecord::Base.logger = Logger.new(STDOUT)
        rescue => e
          $stderr.puts 'connection adapter invalid.'
        end
      end
    end

    def get_models
      @cahce.fetch(MEMORY_STORE_KEY) do
        # get models if cahce empty
        tables =  ActiveRecord::Base.connection.tables
        models = Array.new
        tables.each do |table|
          cls = self.class.const_set(table.classify, Class.new(ActiveRecord::Base))
          cls.table_name = table
          models << cls
        end
        models
      end
      return @cahce.fetch(MEMORY_STORE_KEY)
    end
  end
end
