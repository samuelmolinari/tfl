require 'tfl/api/feed'

module Tfl
  module API
    module StationLocations
      include ::Tfl::API::Feed

      STATION_LOCATIONS_ENDPOINT = '/stations.kml'

      def station_locations_url
        "#{BASE_FEED_URL}#{STATION_LOCATIONS_ENDPOINT}?app_id=#{self.app_id}&app_key=#{self.app_key}"
      end

    end
  end
end
