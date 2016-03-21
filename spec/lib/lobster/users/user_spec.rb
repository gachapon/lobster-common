require_relative '../../../spec_helper'

RSpec.describe Lobster::Users::User do

  context 'with a guest' do
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

    describe '#registration' do
      subject { user.registration }

      it 'is nil' do
        is_expected.to eq nil
      end
    end

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Guest' do
        is_expected.to include 'Guest'
      end
    end
  end

  context 'with a new member' do
    subject(:user) { build(:member, :never_logged_in) }

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

    describe '#last_login' do
      subject { user.last_login }

      it 'is nil' do
        is_expected.to eq nil
      end
    end

    describe '#registration' do
      subject { user.registration }

      it 'is a Time' do
        is_expected.to be_a Time
      end
    end

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Member' do
        is_expected.to include 'Member'
      end
    end
  end

  context 'with a member' do
    subject(:user) { build(:member) }

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

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Member' do
        is_expected.to include 'Member'
      end
    end
  end

  context 'with a moderator' do
    subject(:user) { build(:moderator) }

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

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Mod' do
        is_expected.to include 'Mod'
      end
    end
  end

  context 'with an administrator' do
    subject(:user) { build(:administrator) }

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

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Admin' do
        is_expected.to include 'Admin'
      end
    end
  end

  context 'with a bot' do
    subject(:user) { build(:user, :bot) }

    describe '#clearance' do
      subject { user.clearance }

      it 'is :super' do
        is_expected.to eq :super
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

      it 'is false' do
        is_expected.to eq false
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

      it 'is true' do
        is_expected.to eq true
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

    describe '#registration' do
      subject { user.registration }

      it 'is nil' do
        is_expected.to eq nil
      end
    end

    describe '#to_s' do
      subject { user.to_s }

      it 'contains Super' do
        is_expected.to include 'Super'
      end
    end
  end

  context 'with an online user' do
    subject(:user) { build(:member, :online) }

    describe '#online?' do
      subject { user.online? }

      it 'is true' do
        is_expected.to eq true
      end
    end
  end

  context 'with an offline user' do
    subject(:user) { build(:member, :offline) }

    describe '#online?' do
      subject { user.online? }

      it 'is false' do
        is_expected.to eq false
      end
    end
  end

  describe '#id' do
    let(:id) { Lobster::Uuid.generate }
    subject(:user) { build(:user, id: id) }
    subject { user.id }

    it 'is the expected value' do
      is_expected.to eq id
    end
  end

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

  describe '#to_s' do
    subject(:user) { build(:member) }
    subject { user.to_s }

    it 'contains the alias' do
      is_expected.to include user.alias.to_s
    end

    it 'contains the UUID' do
      is_expected.to include user.id.to_s
    end
  end

  describe '.guest' do
    let(:id) { Lobster::Uuid.generate }
    let(:name) { 'Guest User' }
    let(:is_online) { true }
    let(:last_login) { 1.days.ago }
    subject { Lobster::Users::User.guest(id, name, is_online, last_login) }

    context 'with a nil ID' do
      let(:id) { nil }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a non-UUID ID' do
      let(:id) { 'foobar' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a nil alias' do
      let(:name) { nil }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a non-string alias' do
      let(:name) { Hash.new }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a nil last login' do
      let(:last_login) { nil }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a non-time last login' do
      let(:last_login) { 'foobar' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a falsey online flag' do
      let(:is_online) { nil }

      it 'sets the user as offline' do
        expect(subject.online?).to eq false
      end
    end

    context 'with a truthy online flag' do
      let(:is_online) { 'foobar' }

      it 'sets the user as online' do
        expect(subject.online?).to eq true
      end
    end
  end

  describe '.member' do
    let(:id) { Lobster::Uuid.generate }
    let(:name) { 'Guest User' }
    let(:is_online) { true }
    let(:clearance) { :member }
    let(:registration) { 5.months.ago }
    let(:last_login) { 1.days.ago }
    subject { Lobster::Users::User.member(id, name, is_online, clearance, registration, last_login) }

    context 'with a nil ID' do
      let(:id) { nil }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a non-UUID ID' do
      let(:id) { 'foobar' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a nil alias' do
      let(:name) { nil }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a non-string alias' do
      let(:name) { Hash.new }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a nil last login' do
      let(:last_login) { nil }

      it 'stores the value' do
        expect(subject.last_login).to eq nil
      end
    end

    context 'with a non-time last login' do
      let(:last_login) { 'foobar' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a falsey online flag' do
      let(:is_online) { nil }

      it 'sets the user as offline' do
        expect(subject.online?).to eq false
      end
    end

    context 'with a truthy online flag' do
      let(:is_online) { 'foobar' }

      it 'sets the user as online' do
        expect(subject.online?).to eq true
      end
    end

    context 'with a nil registration' do
      let(:registration) { nil }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a non-time registration' do
      let(:registration) { 'foobar' }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a guest clearance' do
      let(:clearance) { :guest }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with an invalid clearance' do
      let(:clearance) { :foobar }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a nil clearance' do
      let(:clearance) { nil }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end

    context 'with a non-symbol clearance' do
      let(:clearance) { 5 }

      it 'raises an ArgumentError' do
        expect { subject }.to raise_error ArgumentError
      end
    end
  end

end
