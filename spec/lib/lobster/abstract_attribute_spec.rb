require_relative '../../spec_helper'

RSpec.describe 'abstract' do
  subject(:klass) do
    klass = Class.new
    klass.send(:abstract, :abstract_method)
    klass
  end

  it 'is private' do
    expect(Class.private_methods).to include(:abstract)
  end

  it 'creates a method' do
    expect(klass.public_instance_methods).to include(:abstract_method)
  end

  describe 'the method' do
    let(:instance) { klass.new }
    subject(:call) { instance.abstract_method }

    it 'raises NotImplementError' do
      expect { call }.to raise_error NotImplementedError
    end

    describe 'the error' do
      subject do
        begin
          call
          nil
        rescue Object => ex
          ex
        end.to_s
      end

      it 'says the method is abstract' do
        is_expected.to include('abstract')
      end
    end
  end

end
