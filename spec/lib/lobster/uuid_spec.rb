require_relative '../../spec_helper'

VALID_UUID_REGEX    = /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i
UUID_STRING1        = 'de305d54-75b4-431b-adb2-eb6b9e546014'
UUID_STRING2        = 'de305d54-75b4-431b-adb2-eb6b9e546020'
UUID_PACKED_STRING1 = "\xde\x30\x5d\x54\x75\xb4\x43\x1b\xad\xb2\xeb\x6b\x9e\x54\x60\x14"
UUID_PACKED_STRING2 = "\xde\x30\x5d\x54\x75\xb4\x43\x1b\xad\xb2\xeb\x6b\x9e\x54\x60\x20"

RSpec.describe Lobster::Uuid do

  describe '::DEFAULT' do
    subject { Lobster::Uuid::DEFAULT }

    it 'is all zeroes' do
      expect(subject).to eq("\x0" * 16)
    end

    it 'is frozen' do
      is_expected.to be_frozen
    end
  end
  
  describe '#new' do
    context 'with no parameters' do
      subject(:uuid) { Lobster::Uuid.new }

      describe 'the value' do
        subject { uuid.value }

        # The chances of a randomly generated empty UUID is virtually impossible.
        # Besides, the UUID standards don't allow generated UUID to be all zeroes.
        it 'is random' do
          is_expected.not_to eq("\x0" * 16)
        end
      end

      describe 'the string' do
        subject { uuid.to_s }

        it 'is valid' do
          is_expected.to match VALID_UUID_REGEX
        end
      end
    end

    context 'with a valid value' do
      subject(:uuid) { Lobster::Uuid.new(UUID_PACKED_STRING1) }

      describe 'the value' do
        subject { uuid.value }

        it 'is stored' do
          is_expected.to eq UUID_PACKED_STRING1
        end
      end
    end

    context 'with an invalid value' do
      it 'rejects a non-string' do
        expect { Lobster::Uuid.new(5) }.to raise_error(ArgumentError)
      end

      it 'rejects a malformed string' do
        expect { Lobster::Uuid.new('foobar') }.to raise_error(ArgumentError)
      end
    end

  end

  describe '.parse' do

    context 'with a valid UUID' do
      subject { Lobster::Uuid.parse(UUID_STRING1) }

      it 'parses correctly' do
        expect(subject.to_s).to eq(UUID_STRING1)
      end
    end

    context 'with a malformed string' do
      it 'returns nil' do
        expect(Lobster::Uuid.parse('foobar')).to be_nil
      end
    end

    context 'with an invalid argument' do
      it 'rejects a non-string' do
        expect { Lobster::Uuid.parse(5) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#value' do
    subject(:uuid) { Lobster::Uuid.new(UUID_PACKED_STRING1).value }

    it 'is a string' do
      is_expected.to be_a(String)
    end

    it 'is frozen' do
      is_expected.to be_frozen
    end

    describe '.length' do
      subject { uuid.length }

      it 'is 16 bytes' do
        is_expected.to be 16
      end
    end
  end

  describe '#eql?' do
    subject(:uuid) { Lobster::Uuid.new(UUID_PACKED_STRING1) }
    subject { uuid.eql?(other) }

    context 'with two identical UUIDs' do
      let(:other) { Lobster::Uuid.new(UUID_PACKED_STRING1) }

      it 'returns true' do
        is_expected.to eq true
      end
    end

    context 'with two different UUIDs' do
      let(:other) { Lobster::Uuid.new(UUID_PACKED_STRING2) }

      it 'returns false' do
        is_expected.to eq false
      end
    end

    context 'without a UUID' do
      let(:other) { 'foobar' }

      it 'returns false' do
        is_expected.to eq false
      end
    end
  end

  describe '#==' do
    subject { first == second }
    let(:first) { Lobster::Uuid.new(UUID_PACKED_STRING1) }

    context 'with equal UUIDs' do
      let(:second) { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      it 'is true' do
        is_expected.to be true
      end
    end

    context 'with the same instance' do
      let(:second) { first }
      it 'is true' do
        is_expected.to be true
      end
    end

    context 'with unequal UUIDs' do
      let(:second) { Lobster::Uuid.new(UUID_PACKED_STRING2) }
      it 'is false' do
        is_expected.to be false
      end
    end

    context 'with nil' do
      let(:second) { nil }
      it 'is false' do
        is_expected.to be false
      end
    end

    context 'with a malformed string' do
      let(:second) { 'foobar' }
      it 'is false' do
        is_expected.to be false
      end
    end

    context 'with a non-string' do
      let(:second) { 5 }
      it 'is false' do
        is_expected.to be false
      end
    end

    context 'with identical value' do
      let(:second) { first.value }
      it 'is true' do
        is_expected.to be true
      end
    end

    context 'with identical string' do
      let(:second) { first.to_s }
      it 'is true' do
        is_expected.to be true
      end
    end
  end

  describe '#<=>' do
    subject { first <=> second }

    context 'with an equal UUID' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      it 'is 0' do
        is_expected.to eq 0
      end
    end

    context 'with the same instance' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { first }
      it 'is 0' do
        is_expected.to eq 0
      end
    end

    context 'with a lesser UUID' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING2) }
      let(:second) { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      it 'is 1' do
        is_expected.to eq 1
      end
    end

    context 'with a greater UUID' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { Lobster::Uuid.new(UUID_PACKED_STRING2) }
      it 'is -1' do
        is_expected.to eq(-1)
      end
    end

    context 'with nil' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { nil }
      it 'is nil' do
        is_expected.to be_nil
      end
    end

    context 'with a number' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { 500 }
      it 'is nil' do
        is_expected.to be_nil
      end
    end

    context 'with an identical value' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { UUID_PACKED_STRING1 }
      it 'is 0' do
        is_expected.to eq 0
      end
    end

    context 'with a lesser value' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING2) }
      let(:second) { UUID_PACKED_STRING1 }
      it 'is 1' do
        is_expected.to eq 1
      end
    end

    context 'with a greater value' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { UUID_PACKED_STRING2 }
      it 'is -1' do
        is_expected.to eq(-1)
      end
    end

    context 'with an equal string' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { UUID_STRING1 }
      it 'is 0' do
        is_expected.to eq 0
      end
    end

    context 'with a lesser string' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING2) }
      let(:second) { UUID_STRING1 }
      it 'is 1' do
        is_expected.to eq 1
      end
    end

    context 'with a greater string' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1) }
      let(:second) { UUID_STRING2 }
      it 'is -1' do
        is_expected.to eq(-1)
      end
    end

    context 'with an invalid string' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING2) }
      let(:second) { 'foobar' }
      it 'is nil' do
        is_expected.to be_nil
      end
    end
  end

  describe '#hash' do
    subject { Lobster::Uuid.new(UUID_PACKED_STRING1).hash }

    it 'is a Fixnum' do
      is_expected.to be_a(Fixnum)
    end

    context 'with identical UUIDs' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1).hash }
      let(:second) { Lobster::Uuid.new(UUID_PACKED_STRING1).hash }

      it 'returns identical values' do
        expect(first).to eq(second)
      end
    end

    context 'with different UUIDs' do
      let(:first)  { Lobster::Uuid.new(UUID_PACKED_STRING1).hash }
      let(:second) { Lobster::Uuid.new(UUID_PACKED_STRING2).hash }

      it 'returns different values' do
        expect(first).to_not eq(second)
      end
    end
  end

  describe '#to_s' do
    subject { Lobster::Uuid.new(UUID_PACKED_STRING1).to_s }

    it 'is a String' do
      is_expected.to be_a String
    end

    it 'is a valid UUID string' do
      is_expected.to match(VALID_UUID_REGEX)
    end

    it 'equals the initial value' do
      is_expected.to eq(UUID_STRING1)
    end

    context 'with bytes less than 16' do
      subject { Lobster::Uuid.new("\x05\x30\x5d\x54\x75\x02\x43\x1b\xad\xb2\xeb\x6b\x9e\x54\x60\x00").to_s }

      it 'pads with zeroes' do
        is_expected.to eq('05305d54-7502-431b-adb2-eb6b9e546000')
      end
    end
  end

end
