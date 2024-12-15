require 'spec_helper'
require_relative './../../lib/file_action'

RSpec.describe FileAction do
  subject(:action) { FileAction.new(output: output) }
  let(:file) { File.open('spec/fixtures/test.txt') }
  let(:output) { StringIO.new }

  describe "#count" do
    it "outputs the number of characters" do
      expect(output).to receive(:puts).with(489)
      action.count(file)
    end
  end

  describe "#line" do
    it "outputs the number of lines" do
      expect(output).to receive(:puts).with(9)
      action.line(file)
    end
  end

  describe "#words" do
    it "outputs the number of words" do
      expect(output).to receive(:puts).with(91)
      action.words(file)
    end
  end

  describe "#byte_count" do
    it "outputs the number of characters" do
      expect(output).to receive(:puts).with(489)
      action.byte_count(file)
    end
  end
end