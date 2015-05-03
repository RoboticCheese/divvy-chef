# Encoding: UTF-8

require_relative '../spec_helper'
require_relative '../../libraries/provider_divvy_app'

describe Chef::Provider::DivvyApp do
  let(:name) { 'Some App' }
  let(:new_resource) { Chef::Resource::DivvyApp.new(name, nil) }
  let(:provider) { described_class.new(new_resource, nil) }

  describe '#whyrun_supported?' do
    it 'returns true' do
      expect(provider.whyrun_supported?).to eq(true)
    end
  end

  describe '#action_install' do
    before(:each) do
      allow_any_instance_of(described_class).to receive(:install!)
    end

    it 'calls the child `install!` method ' do
      expect_any_instance_of(described_class).to receive(:install!)
      provider.action_install
    end

    it 'sets the resource installed status' do
      p = provider
      p.action_install
      expect(p.new_resource.installed?).to eq(true)
    end
  end

  describe '#action_run' do
    before(:each) do
      allow_any_instance_of(described_class).to receive(:start!)
    end

    it 'calls the child `start!` method' do
      expect_any_instance_of(described_class).to receive(:start!)
      provider.action_run
    end

    it 'sets the resource running status' do
      p = provider
      p.action_run
      expect(p.new_resource.running?).to eq(true)
    end
  end

  describe '#start!' do
    it 'raises an error' do
      expect { provider.send(:start!) }.to raise_error(NotImplementedError)
    end
  end

  describe '#install!' do
    it 'raises an error' do
      expect { provider.send(:install!) }.to raise_error(NotImplementedError)
    end
  end
end