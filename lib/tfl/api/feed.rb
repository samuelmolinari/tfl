require 'httparty'

module Tfl
  module API
    module Feed
      BASE_FEED_URL = "http://data.tfl.gov.uk/tfl/syndication/feeds"

      def fetch_feed(url)
        ::HTTParty.get(url, feed_options)
      end

      protected

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
