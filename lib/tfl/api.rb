require 'tfl/api/station_locations'
require 'tfl/api/station_facilities'

module Tfl
  module API
    include Tfl::API::StationLocations
    include Tfl::API::StationFacilities
  end
end
