require 'spec_helper'

class DummyClass < Struct.new(:app_id, :app_key)
  include Tfl::API::StationLocations
end

describe ::Tfl::API::StationLocations do

  let(:app_id) { 'my_app_id' }
  let(:app_key) { 'my_app_key' }
  subject(:api) { DummyClass.new(app_id, app_key) }

  describe '#station_locations_url' do
    subject(:url) { api.station_locations_url }
    it { is_expected.to eq "#{::Tfl::API::Feed::BASE_FEED_URL}#{described_class::STATION_LOCATIONS_ENDPOINT}?app_id=#{app_id}&app_key=#{app_key}" }
  end

end
