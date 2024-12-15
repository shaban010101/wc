require 'spec_helper'
require_relative './../../lib/parser'

RSpec.describe Parser do
  subject(:parse) { described_class.new.parse(options) }
  let(:file_name) { "test.txt" }
  let(:file_action)  { instance_double(FileAction) }

  before do
    allow(FileAction).to receive(:new).and_return(file_action)
  end

  describe ".parse" do
    context "when no arguments are provided" do
      let(:options) { ["test.txt"] }

      it "outputs all the counts" do
        expect(file_action).to receive(:line).with(file_name)
        expect(file_action).to receive(:words).with(file_name)
        expect(file_action).to receive(:byte_count).with(file_name)

        parse
      end
    end

    context "when the count argument is provided" do
      let(:options) { ["-c", "test.txt"] }

      it "calls the word count" do
        expect(file_action).to receive(:count).with(file_name)
        parse
      end
    end

    context "when the line argument is provided" do
      let(:options) { ["-l", "test.txt"] }

      it "calls line count" do
        expect(file_action).to receive(:line).with(file_name)
        parse
      end
    end

    context "when the words argument is provided" do
      let(:options) { ["-w", "test.txt"] }

      it "calls the words count" do
        expect(file_action).to receive(:words).with(file_name)
        parse
      end
    end

    context "when the multibyte argument is provided" do
      let(:options) { ["-m", "test.txt"] }

      it "calls the multibyte" do
        expect(file_action).to receive(:byte_count).with(file_name)
        parse
      end
    end
  end
end