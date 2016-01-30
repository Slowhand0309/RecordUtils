# encoding: utf-8

require "record_utils"
require "spec_helper"

RSpec.describe RecordUtils::RecordClear do

  let(:rb) { RecordUtils::RecordBase.new }

  before do
    rb.connect
  end

  after do
    ActiveRecord::Base.remove_connection
  end

  describe 'clear functions test' do
    it 'clear_all' do
      rb.clear_all
      models =  rb.get_models
      models.each do |m|
        expect(m.all.size).to eq 0
      end
    end
  end
end
