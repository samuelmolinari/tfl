require 'tfl/point'
require 'tfl/style'

module Tfl
  class Placemark
    attr_accessor :name, :description, :point, :style

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def ==(other)
      other.respond_to?(:point) && @point == other.point
    end
  end
end
