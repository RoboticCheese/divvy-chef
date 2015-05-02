# Encoding: UTF-8

require_relative '../spec_helper'

describe 'Divvy app' do
  describe file('/Applications/Divvy.app') do
    it 'is present on the filesystem' do
      expect(subject).to be_directory
    end
  end

  describe process('Divvy') do
    it 'is running' do
      expect(subject).to be_running
    end
  end
end
