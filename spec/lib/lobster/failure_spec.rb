require_relative '../../spec_helper'

RSpec.describe Lobster::Failure do
  let(:code) { Lobster::ErrorCodes::UNEXPECTED }
  let(:data) { { :foo => 'bar' }.freeze }
  let(:error) { Lobster::Error.new(code, data) }
  subject(:result) { Lobster::Failure.new(error) }

  describe '#ok?' do
    subject { result.ok? }

    it 'is false' do
      is_expected.to eq false
    end
  end

  describe '#fail?' do
    subject { result.fail? }

    it 'is true' do
      is_expected.to eq true
    end
  end

  describe '#error' do
    subject { result.error }

    it 'is the expected value' do
      is_expected.to eq error
    end
  end

  describe '#to_s' do
    subject { result.to_s }

    it 'contains failure' do
      is_expected.to include 'Failure'
    end

    it 'contains the error' do
      is_expected.to include error.to_s
    end
  end
end
