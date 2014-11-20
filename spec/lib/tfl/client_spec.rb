require 'spec_helper'

describe ::Tfl::Client do

  let(:app_id) { 'my app id' }
  let(:app_key) { 'my app key' }

  let(:client) { described_class.new(app_id: app_id, app_key: app_key) }

  context 'when initialized with block' do
    subject(:client) do
      described_class.new do |config|
        config.app_id = app_id
        config.app_key = app_key
      end
    end

    it { is_expected.to have_attributes(:app_id => app_id,
                                        :app_key => app_key) }
  end

  context 'when initialized with hash' do
    subject(:client) { described_class.new(app_id: app_id, app_key: app_key) }

    it { is_expected.to have_attributes(:app_id => app_id,
                                        :app_key => app_key) }
  end

  describe '#credentials' do
    it 'returns a hash' do
      expect(client.credentials).to eq({:app_id => app_id, :app_key => app_key})
    end
  end

end
