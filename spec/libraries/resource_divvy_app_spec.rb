# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/resource_divvy_app'

describe Chef::Resource::DivvyApp do
  let(:name) { 'default' }
  let(:resource) { described_class.new(name, nil) }

  describe '#initialize' do
    it 'sets the correct resource name' do
      exp = :divvy_app
      expect(resource.instance_variable_get(:@resource_name)).to eq(exp)
    end

    it 'sets the installed status to nil' do
      expect(resource.instance_variable_get(:@installed)).to eq(nil)
    end
  end

  [:installed, :installed?].each do |m|
    describe "##{m}" do
      context 'default unknown installed status' do
        it 'returns nil' do
          expect(resource.send(m)).to eq(nil)
        end
      end

      context 'app installed' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@installed, true)
          r
        end

        it 'returns true' do
          expect(resource.send(m)).to eq(true)
        end
      end

      context 'app not installed' do
        let(:resource) do
          r = super()
          r.instance_variable_set(:@installed, false)
          r
        end

        it 'returns true' do
          expect(resource.send(m)).to eq(false)
        end
      end
    end
  end
end
