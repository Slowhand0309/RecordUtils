# encoding: utf-8

require "record_utils"
require "spec_helper"

RSpec.describe RecordUtils::RecordClear do

  it 'clear_all' do
    r = RecordUtils::RecordClear.new
    r.connect

    r.clear_all
    models =  r.get_models

    models.each do |m|
      expect(m.all.size).to eq 0
    end
  end
end
