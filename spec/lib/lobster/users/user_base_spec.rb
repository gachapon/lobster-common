require_relative '../../../spec_helper'

RSpec.describe Lobster::Users::UserBase do

  describe '#alias' do
    subject(:user) { build(:user_base, name: 'Joe') }
    subject { user.alias }

    it 'is a String' do
      is_expected.to be_a String
    end

    it 'is frozen' do
      is_expected.to be_frozen
    end

    it 'is the expected value' do
      is_expected.to eq 'Joe'
    end
  end

  describe '#new' do
    it 'rejects a nil alias' do
      expect { Lobster::Users::UserBase.new(nil) }.to raise_error ArgumentError
    end

    it 'rejects a non-string alias' do
      expect { Lobster::Users::UserBase.new(5) }.to raise_error ArgumentError
    end
  end

end
