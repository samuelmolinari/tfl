require 'httparty'

module Tfl
  module API
    module Feed
      BASE_FEED_URL = "http://data.tfl.gov.uk/tfl/syndication/feeds"

      KEY_KML = 'kml'
      KEY_ROOT = 'Root'
      KEY_DOCUMENT = 'Document'
      KEY_PLACEMARK = 'Placemark'
      KEY_STYLE = 'Style'

      def fetch_feed(url)
        ::HTTParty.get(url, feed_options)
      end

      protected

      def get_styles(styles_response)
        styles_response.inject({}) do |memo,style|
          s = Style.new(style['id'],style['IconStyle']['Icon']['href'])
          memo[s.id] = s
          memo
        end
      end

      def feed_options
        { query: {
            app_id: self.app_id,
            app_key: self.app_key
          },
          format: feed_format
        }
      end

      def feed_format
        :xml
      end

    end
  end
end
