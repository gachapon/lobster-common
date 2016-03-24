require_relative '../../spec_helper'

RSpec.describe Lobster::Error do
  let(:code) { Lobster::ErrorCodes::UNEXPECTED }
  let(:data) { { :foo => 'bar' }.freeze }
  subject(:error) { Lobster::Error.new(code, data) }

  describe '#code' do
    subject { error.code }

    it 'is a Fixnum' do
      is_expected.to be_a Fixnum
    end

    it 'is the expected value' do
      is_expected.to eq code
    end
  end

  describe '#data' do
    subject { error.data }

    it 'is a Hash' do
      is_expected.to be_a Hash
    end

    it 'is frozen' do
      is_expected.to be_frozen
    end

    it 'contains the expected values' do
      is_expected.to eq data
    end
  end

  describe '#to_s' do
    subject { error.to_s }

    it 'returns a String' do
      is_expected.to be_a String
    end

    it 'has the expected format' do
      is_expected.to match(/^Error: /)
    end

    it 'uses the symbol name' do
      is_expected.to include 'UNEXPECTED'
    end

    it 'includes data' do
      is_expected.to include data.first[0].to_s
      is_expected.to include data.first[1]
    end

    context 'with unrecognized code' do
      let(:code) { -1 }

      it 'uses the numerical value' do
        is_expected.to match(/^Error: -1/)
      end
    end

    context 'with no data' do
      let(:data) { Hash.new }

      it 'doesn\'t include data' do
        is_expected.to eq 'Error: UNEXPECTED'
      end
    end
  end

  describe '#new' do
    it 'accepts unknown integer codes' do
      expect { Lobster::Error.new(-1) }.to_not raise_error
    end

    it 'clones the data' do
      expect(error.data).to_not be data
    end
  end

  describe '.get_code_symbol' do
    subject { Lobster::Error.get_code_symbol(code) }

    context 'with known code' do
      let(:code) { Lobster::ErrorCodes::PERMISSION_DENIED }

      it 'returns the constant' do
        is_expected.to eq :PERMISSION_DENIED
      end
    end

    context 'with unknown code' do
      let(:code) { -1 }

      it 'returns the integer' do
        is_expected.to eq code
      end
    end
  end

end
