module Tfl
  module API
    module StationFacilities
      include ::Tfl::API::Feed

      STATION_FACILITIES_ENDPOINT = '/stations-facilities.xml'

      def fetch_station_facilities
        styles = get_styles(response[KEY_ROOT][KEY_DOCUMENT][KEY_STYLE])
      end

      def station_facilities_url
        "#{BASE_FEED_URL}#{STATION_FACILITIES_ENDPOINT}"
      end
    end
  end
end
