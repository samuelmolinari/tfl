require 'tfl/line'
require 'tfl/station/type'
require 'tfl/station/contact_details'
require 'tfl/station/facility'
require 'tfl/station/entrence'
require 'tfl/station/opening_hour'

module Tfl
  class Station
    attr_accessor :id,
                  :type,
                  :name,
                  :placemark,
                  :contact_details,
                  :serving_lines,
                  :zones,
                  :facilities,
                  :entrences,
                  :opening_hours

    def initialize(options = {})
      array_options = [:serving_lines, :zones, :facilities,
                       :entrences, :opening_hours]

      array_options.each do |key|
        instance_variable_set("@#{key}", options[key] || [])
        options.delete(key)
      end

      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end
  end
end
