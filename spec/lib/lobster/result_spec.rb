require_relative '../../spec_helper'

RSpec.describe Lobster::Result do
  context 'with successful result' do
    let(:value) { 'foobar'.freeze }
    subject(:result) { Lobster::Success.new(value) }

    describe '#default' do
      subject { result.default { 'nope' } }

      it 'returns the value' do
        is_expected.to be value
      end
    end
  end

  context 'with failure result' do
    let(:code) { Lobster::ErrorCodes::UNEXPECTED }
    let(:data) { { :foo => 'bar' }.freeze }
    let(:error) { Lobster::Error.new(code, data) }
    subject(:result) { Lobster::Failure.new(error) }

    describe '#default' do
      let(:default) { 'yes' }
      subject { result.default { default } }

      it 'returns the yielded value' do
        is_expected.to be default
      end
    end
  end
end
