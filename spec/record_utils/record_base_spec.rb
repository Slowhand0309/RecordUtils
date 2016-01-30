# encoding: utf-8

require "record_utils"
require "spec_helper"

RSpec.describe RecordUtils::RecordBase do

  let(:rb) { RecordUtils::RecordBase.new }

  before do
    rb.connect
  end

  after do
    ActiveRecord::Base.remove_connection
  end

  describe 'base functions test' do
    it 'all tables convert models' do

      tables = ActiveRecord::Base.connection.tables
      models =  rb.get_models

      expect(models.size).to eq tables.size
      models.each_with_index do |m, idx|
        expect(m.table_name).to eq tables[idx]
      end
    end
  end
end
