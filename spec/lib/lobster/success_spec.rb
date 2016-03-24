require_relative '../../spec_helper'

RSpec.describe Lobster::Success do
  let(:value) { 'foobar'.freeze }
  subject(:result) { Lobster::Success.new(value) }

  describe '#ok?' do
    subject { result.ok? }

    it 'is true' do
      is_expected.to eq true
    end
  end

  describe '#fail?' do
    subject { result.fail? }

    it 'is false' do
      is_expected.to eq false
    end
  end

  describe '#value' do
    subject { result.value }

    it 'is the expected value' do
      is_expected.to be value
    end
  end

  describe '#to_s' do
    subject { result.to_s }

    it 'contains success' do
      is_expected.to include 'Success'
    end

    it 'contains the value' do
      is_expected.to include value.to_s
    end
  end
end
