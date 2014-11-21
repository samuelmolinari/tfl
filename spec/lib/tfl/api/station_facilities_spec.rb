require 'spec_helper'

class DummyStationFacilitiesClass < Struct.new(:app_id, :app_key)
  include ::Tfl::API::StationFacilities
end

describe ::Tfl::API::StationFacilities do

  let(:app_id) { 'my_app_id' }
  let(:app_key) { 'my_app_key' }
  subject(:api) { DummyStationFacilitiesClass.new(app_id, app_key) }

  describe '#station_facilities_url' do
    subject(:url) { api.station_facilities_url }
    it { is_expected.to eq "#{::Tfl::API::Feed::BASE_FEED_URL}#{described_class::STATION_FACILITIES_ENDPOINT}" }
  end

  describe '#fetch_station_facilities' do

    context 'with remote response', integration: true, slow: true do

      it 'fetches all stations' do
        stations = api.fetch_station_facilities
      end
    end
  end

end
