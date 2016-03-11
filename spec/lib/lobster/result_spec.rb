require_relative '../../spec_helper'

RSpec.describe Lobster::Result do
  context 'with successful result' do
    let(:value) { 'foobar'.freeze }
    subject(:result) { Lobster::Result.success(value) }

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

      it 'is the exected value' do
        is_expected.to be value
      end
    end

    describe '#error' do
      subject { result.error }

      it 'is nil' do
        is_expected.to eq nil
      end
    end

    describe '#default' do
      subject { result.default { 'nope' } }

      it 'returns the value' do
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

  context 'with failure result' do
    let(:code) { Lobster::ErrorCodes::UNEXPECTED }
    let(:data) { { :foo => 'bar' }.freeze }
    let(:error) { Lobster::Error.new(code, data) }
    subject(:result){ Lobster::Result.failure(error) }

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

    describe '#value' do
      it 'raises an exception' do
        expect { result.value }.to raise_error RuntimeError
      end
    end

    describe '#error' do
      subject { result.error }

      it 'is the expected value' do
        is_expected.to eq error
      end
    end

    describe '#default' do
      let(:default) { 'yes' }
      subject { result.default { default } }

      it 'returns the yielded value' do
        is_expected.to be default
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

  describe '.failure' do
    context 'with non-error' do
      it 'rejects the value' do
        expect { Lobster::Result.failure('foobar') }.to raise_error ArgumentError
      end
    end
  end
end
