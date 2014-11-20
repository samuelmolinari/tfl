require 'tfl/point'

module Tfl
  class Station
    attr_accessor :name, :description, :point

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
