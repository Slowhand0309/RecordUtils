# encoding: utf-8

require "record_utils"
require "spec_helper"

RSpec.describe RecordUtils::RecordDump do

  let(:rb) { RecordUtils::RecordBase.new }

  before do
    rb.connect
  end

  after do
    ActiveRecord::Base.remove_connection
  end

  describe 'dump functions test' do

    it 'unsupport type' do
      type = :xxx
      expect{rb.dump("hoge", type)}.to raise_error(ArgumentError, "not support type #{type}")
    end

    it 'json' do
      dump_test("dump/dump.json", :json)
    end

    it 'xml' do
      dump_test("dump/dump.xml", :xml)
    end

    it 'yaml' do
      dump_test("dump/dump.yaml", :yaml)
    end

    it 'csv' do
      if File.exist?("dump/dump.csv")
        File.delete("dump/dump.csv")
      end

      type = :csv
      rb.dump("dump/dump.csv", type)

      #expect(File.exist?("dump/dump.csv")).to eq true
    end

    def dump_test(file, type)
      if File.exist?(file)
        File.delete(file)
      end

      rb.dump(file, type)
      expect(File.exist?(file)).to eq true
    end

  end
end
