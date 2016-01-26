# encoding: utf-8

require "record_utils"
require "spec_helper"

RSpec.describe RecordUtils::RecordDump do

  it 'unsupport type' do
    r = RecordUtils::RecordDump.new
    r.connect

    type = :xxx
    expect{r.dump("hoge", type)}.to raise_error(ArgumentError, "not support type #{type}")
  end

  it 'json' do

    if File.exist?("dump/dump.json")
      File.delete("dump/dump.json")
    end

    r = RecordUtils::RecordDump.new
    r.connect

    type = :json
    r.dump("dump/dump.json", type)

    expect(File.exist?("dump/dump.json")).to eq true
  end

  it 'xml' do
    if File.exist?("dump/dump.xml")
      File.delete("dump/dump.xml")
    end

    r = RecordUtils::RecordDump.new
    r.connect

    type = :xml
    r.dump("dump/dump.xml", type)

    expect(File.exist?("dump/dump.xml")).to eq true
  end

  it 'yaml' do
    if File.exist?("dump/dump.yaml")
      File.delete("dump/dump.yaml")
    end

    r = RecordUtils::RecordDump.new
    r.connect

    type = :yaml
    r.dump("dump/dump.yaml", type)

    expect(File.exist?("dump/dump.yaml")).to eq true
  end
end
