require 'tfl/api/feed'

module Tfl
  module API
    module StationLocations
      include ::Tfl::API::Feed

      STATION_LOCATIONS_ENDPOINT = '/stations.kml'

      KEY_ROOT = 'kml'
      KEY_DOCUMENT = 'Document'
      KEY_PLACEMARK = 'Placemark'
      KEY_STYLE = 'Style'

      def fetch_station_locations
        response = fetch_feed(station_locations_url)
        styles = get_styles(response)

        placemarks = response[KEY_ROOT][KEY_DOCUMENT][KEY_PLACEMARK]
        placemarks.map do |placemark|
          Placemark.new(
              name: placemark['name'].strip,
              description: placemark['description'].strip,
              point: Point.new(placemark['Point']['coordinates'].strip),
              style: styles[placemark['styleUrl'].strip.sub('#','')]
            )
        end
      end

      def station_locations_url
        "#{BASE_FEED_URL}#{STATION_LOCATIONS_ENDPOINT}"
      end

      protected

      def get_styles(response)
        styles = response[KEY_ROOT][KEY_DOCUMENT][KEY_STYLE]
        styles.inject({}) do |memo,style|
          s = Style.new(style['id'],style['IconStyle']['Icon']['href'])
          memo[s.id] = s
          memo
        end
      end

    end
  end
end
