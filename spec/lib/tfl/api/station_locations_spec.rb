require 'spec_helper'

class DummyStationLocationsClass < Struct.new(:app_id, :app_key)
  include Tfl::API::StationLocations
end

describe ::Tfl::API::StationLocations do

  let(:app_id) { 'my_app_id' }
  let(:app_key) { 'my_app_key' }
  subject(:api) { DummyStationLocationsClass.new(app_id, app_key) }

  describe '#station_locations_url' do
    subject(:url) { api.station_locations_url }
    it { is_expected.to eq "#{::Tfl::API::Feed::BASE_FEED_URL}#{described_class::STATION_LOCATIONS_ENDPOINT}" }
  end

  describe '#fetch_station_locations' do

    context 'with remote response', integration: true, slow: true do
      let(:total_stations) { 302 }

      it 'fetches all the placemarks' do
        placemarks = api.fetch_station_locations
        expect(placemarks.size).to be total_stations
      end
    end

    context 'with dummy response' do
      let(:dummy_response) do
        { "kml" => {
            "xmlns" => "http://www.opengis.net/kml/2.2",
            "Document" => {
              "name" => "Transport for London Stations",
              "open" => "0",
              "description" => "Transport for London Stations",
              "Style" => [
                { "id" => "tubeStyle",
                  "IconStyle" => {
                    "Icon" => {
                      "href" => "http://www.tfl.gov.uk/tfl-global/images/syndication/roundel-tube.png"
                    }
                  }
                },
                { "id" => "dlrStyle",
                  "IconStyle" => {
                    "Icon" => {
                      "href" => "http://www.tfl.gov.uk/tfl-global/images/syndication/roundel-dlr.png"
                    }
                  }
                }
              ],
              "Placemark" => [
                { "name" => "\n\t\t\t\tActon Town Station\n\t\t\t",
                  "description" => "Acton Town Station, London Underground Ltd., Gunnersbury Lane, London, W3 8HN",
                  "Point" => {
                    "coordinates" => "\n\t\t\t\t\t-.280251203536110600,51.502749773000570000,0\n\t\t\t\t"
                  },
                  "styleUrl" => "#tubeStyle"
                },
                { "name" => "\n\t\t\t\t\tBeckton Station\n\t\t\t\t\t",
                  "description" => "London Underground, 55 Broadway, London, SW1H 0BD",
                  "Point" => {
                    "coordinates" => "\n\t\t\t\t\t.060942442359961540,51.515133282604730000,0\n\t\t\t\t\t"
                  },
                  "styleUrl" => "#dlrStyle"
                }
              ]
            }
          }
        }
      end

      before(:each) do
        api.stub(:fetch_feed) do
          dummy_response
        end
        @placemarks = api.fetch_station_locations
      end

      it 'returns an array of placemarkes' do
        expect(@placemarks.size).to be 2
        @placemarks.each do |placemark|
          expect(placemark).to be_kind_of ::Tfl::Placemark
        end
      end

      describe 'returned elements' do
        subject(:placemark) { @placemarks.first }
        it { is_expected.to have_attributes(name: 'Acton Town Station',
                                            description: 'Acton Town Station, London Underground Ltd., Gunnersbury Lane, London, W3 8HN',
                                            point: ::Tfl::Point.new('-.280251203536110600,51.502749773000570000,0'),
                                            style: ::Tfl::Style.new('tubeStyle','http://www.tfl.gov.uk/tfl-global/images/syndication/roundel-overground.png')) }
      end

    end

  end

end
