require_relative '../../../spec_helper'

RSpec.describe Lobster::Users::Guest do
  subject(:user) { build(:guest) }

  describe '#clearance' do
    subject { user.clearance }

    it 'is :guest' do
      is_expected.to eq :guest
    end
  end

  describe '#guest?' do
    subject { user.guest? }

    it 'is true' do
      is_expected.to eq true
    end
  end

  describe '#member?' do
    subject { user.member? }

    it 'is false' do
      is_expected.to eq false
    end
  end

  describe '#moderator?' do
    subject { user.moderator? }

    it 'is false' do
      is_expected.to eq false
    end
  end

  describe '#administrator?' do
    subject { user.administrator? }

    it 'is false' do
      is_expected.to eq false
    end
  end

  describe '#super?' do
    subject { user.super? }

    it 'is false' do
      is_expected.to eq false
    end
  end

  describe '#staff?' do
    subject { user.staff? }

    it 'is false' do
      is_expected.to eq false
    end
  end

  describe '#last_login' do
    subject { user.last_login }

    it 'is a Time' do
      is_expected.to be_a Time
    end
  end

  describe '#id' do
    let(:id) { Lobster::Uuid.generate }
    subject(:user) { build(:guest, id: id) }
    subject { user.id }

    it 'is the expected value' do
      is_expected.to eq id
    end
  end

  describe '#alias' do
    subject(:user) { build(:guest, name: 'Joe') }
    subject { user.alias }

    it 'is the expected value' do
      is_expected.to eq 'Joe'
    end

    it 'is frozen' do
      is_expected.to be_frozen
    end
  end

  describe '#to_s' do
    subject { user.to_s }

    it 'contains the alias' do
      is_expected.to include user.alias.to_s
    end

    it 'contains the UUID' do
      is_expected.to include user.id.to_s
    end

    it 'contains Guest' do
      is_expected.to include 'Guest'
    end
  end

end
