require 'tfl/api/feed'

module Tfl
  module API
    module StationLocations
      include ::Tfl::API::Feed

      STATION_LOCATIONS_ENDPOINT = '/stations.kml'

      def fetch_station_locations
        response = fetch_feed(station_locations_url)
        styles = get_styles(response[KEY_KML][KEY_DOCUMENT][KEY_STYLE])

        placemarks = response[KEY_KML][KEY_DOCUMENT][KEY_PLACEMARK]
        placemarks.map do |placemark|
          hash_to_placemark(placemark, styles)
        end
      end

      def station_locations_url
        "#{BASE_FEED_URL}#{STATION_LOCATIONS_ENDPOINT}"
      end

      protected

      def hash_to_placemark(placemark_response, styles = {})
        Placemark.new(
          name: placemark_response['name'].strip,
          description: placemark_response['description'].strip,
          point: Point.new(placemark_response['Point']['coordinates'].strip),
          style: styles[placemark_response['styleUrl'].strip.sub('#','')]
        )
      end

    end
  end
end
