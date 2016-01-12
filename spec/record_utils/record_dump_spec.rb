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

  it 'json' do

    if File.exist?("dump/dump.json")
      File.delete("dump/dump.json")
    end
  
    r = RecordUtils::RecordDump.new
    r.connect

    type = :json
    r.dump(type)

    expect(File.exist?("dump/dump.json")).to eq true
  end
end
