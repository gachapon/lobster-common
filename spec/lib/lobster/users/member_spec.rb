require_relative '../../../spec_helper'

RSpec.describe Lobster::Users::Member do
  subject(:user) { build(:member) }

  context 'with a non-staff member' do
    describe '#clearance' do
      subject { user.clearance }

      it 'is :member' do
        is_expected.to eq :member
      end
    end

    describe '#guest?' do
      subject { user.guest? }

      it 'is false' do
        is_expected.to eq false
      end
    end

    describe '#member?' do
      subject { user.member? }

      it 'is true' do
        is_expected.to eq true
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

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Member' do
        is_expected.to include 'Member'
      end
    end
  end

  context 'with a moderator' do
    subject(:user) { build(:member, :mod) }

    describe '#clearance' do
      subject { user.clearance }

      it 'is :mod' do
        is_expected.to eq :mod
      end
    end

    describe '#guest?' do
      subject { user.guest? }

      it 'is false' do
        is_expected.to eq false
      end
    end

    describe '#member?' do
      subject { user.member? }

      it 'is true' do
        is_expected.to eq true
      end
    end

    describe '#moderator?' do
      subject { user.moderator? }

      it 'is true' do
        is_expected.to eq true
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

      it 'is true' do
        is_expected.to eq true
      end
    end

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Mod' do
        is_expected.to include 'Mod'
      end
    end
  end

  context 'with an administrator' do
    subject(:user) { build(:member, :admin) }

    describe '#clearance' do
      subject { user.clearance }

      it 'is :admin' do
        is_expected.to eq :admin
      end
    end

    describe '#guest?' do
      subject { user.guest? }

      it 'is false' do
        is_expected.to eq false
      end
    end

    describe '#member?' do
      subject { user.member? }

      it 'is true' do
        is_expected.to eq true
      end
    end

    describe '#moderator?' do
      subject { user.moderator? }

      it 'is true' do
        is_expected.to eq true
      end
    end

    describe '#administrator?' do
      subject { user.administrator? }

      it 'is true' do
        is_expected.to eq true
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

      it 'is true' do
        is_expected.to eq true
      end
    end

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Admin' do
        is_expected.to include 'Admin'
      end
    end
  end

  describe '#last_login' do
    subject { user.last_login }

    it 'is a Time' do
      is_expected.to be_a Time
    end
  end

  describe '#registration' do
    subject { user.registration }

    it 'is a Time' do
      is_expected.to be_a Time
    end
  end

  describe '#id' do
    let(:id) { Lobster::Uuid.generate }
    subject(:user) { build(:member, id: id) }
    subject { user.id }

    it 'is the expected value' do
      is_expected.to eq id
    end
  end

  describe '#alias' do
    subject(:user) { build(:member, name: 'Joe') }
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
  end

end
