module Tfl
  class Point
    attr_accessor :coordinates

    def initialize(options = {})
      if options.is_a? Hash
        @coordinates = {
          :lat => options[:lat],
          :lng => options[:lng],
          :alt => options[:alt]
        }
      elsif options.is_a? String
        @coordinates = coordinates_from_str(options)
      end
    end

    def lat
      @coordinates[:lat]
    end

    def lng
      @coordinates[:lng]
    end

    def alt
      @coordinates[:alt]
    end

    private

    def coordinates_from_str(coordinates)
      Hash[[:lat, :lng, :alt].zip coordinates.split(',').map(&:to_f)]
    end
  end
end
