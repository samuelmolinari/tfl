require 'spec_helper'

describe ::Tfl::Station do

  subject(:station) { described_class.new }

  it { is_expected.to have_attributes(id: nil,
                                      type: nil,
                                      name: nil,
                                      placemark: nil,
                                      contact_details: nil,
                                      serving_lines: [],
                                      facilities: [],
                                      zones: [],
                                      entrences: [],
                                      opening_hours: []) }

  context 'when initialized with hash' do
    let(:id) { '00000' }
    let(:name) { 'South Woodford' }
    let(:type) { described_class::Type::TUBE }
    let(:placemark) { ::Tfl::Placemark.new }
    let(:contact_details) { ::Tfl::Station::ContactDetails.new }
    let(:serving_lines) { [::Tfl::Line.new] }
    let(:facilities) { [::Tfl::Station::Facility.new] }
    let(:zones) { [1] }
    let(:entrences) { [::Tfl::Station::Entrence.new] }
    let(:opening_hours) { [::Tfl::Station::OpeningHour.new] }

    subject(:station) { described_class.new(id: id,
                                            type: type,
                                            name: name,
                                            placemark: placemark,
                                            contact_details: contact_details,
                                            serving_lines: serving_lines,
                                            facilities: facilities,
                                            zones: zones,
                                            entrences: entrences,
                                            opening_hours: opening_hours) }

    it { is_expected.to have_attributes(id: id,
                                        type: type,
                                        name: name,
                                        placemark: placemark,
                                        contact_details: contact_details,
                                        serving_lines: serving_lines,
                                        facilities: facilities,
                                        zones: zones,
                                        entrences: entrences,
                                        opening_hours: opening_hours) }
  end

end
