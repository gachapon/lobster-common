require_relative '../../../spec_helper'

RSpec.describe Lobster::Users::User do
  subject(:user) { build(:user, *traits) }
  let(:traits) { Array.new }

  describe '#alias' do
    subject(:user) { build(:user, name: 'Joe') }
    subject { user.alias }

    it 'is the expected value' do
      is_expected.to eq 'Joe'
    end

    it 'is frozen' do
      is_expected.to be_frozen
    end
  end

  describe '#last_login' do
    subject { user.last_login }

    context 'with newly registered member' do
      let(:traits) { [:never_logged_in] }

      it 'is nil' do
        is_expected.to eq nil
      end
    end

    it 'is a Time' do
      is_expected.to be_a Time
    end

    it 'is frozen' do
      is_expected.to be_frozen
    end
  end

end
