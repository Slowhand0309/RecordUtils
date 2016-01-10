# encoding: utf-8

require "record_utils"
require "spec_helper"

RSpec.describe RecordUtils::RecordDump do

  it 'unsupport type' do
    r = RecordUtils::RecordDump.new
    r.connect

    type = :xxx
    expect{r.dump(type)}.to raise_error(ArgumentError, "not support type #{type}")
  end
end
