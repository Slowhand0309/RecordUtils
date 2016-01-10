# encoding: utf-8

require "record_utils"
require "spec_helper"

RSpec.describe RecordUtils::RecordBase do

  it 'all tables convert models' do
    r = RecordUtils::RecordBase.new
    r.connect

    tables = ActiveRecord::Base.connection.tables
    models =  r.get_models

    expect(models.size).to eq tables.size
    models.each_with_index do |m, idx|
      expect(m.table_name).to eq tables[idx]
    end
  end
end
