require 'spec_helper'

describe ::Tfl::Point do

  let(:lat) { -1 }
  let(:lng) { 1 }
  let(:alt) { 2 }
  subject(:point) { described_class.new }

  it { is_expected.to have_attributes(:coordinates => { lat: nil,
                                                        lng: nil,
                                                        alt: nil }) }

  describe 'when initialized with hash' do
    subject(:point) { described_class.new(lat: lat, lng: lng, alt: alt) }
    it { is_expected.to have_attributes(:coordinates => { lat: lat,
                                                          lng: lng,
                                                          alt: alt}) }
  end

  describe 'when initialized with string' do
    subject(:point) do
      described_class.new('.027317133742799650,51.591725648273090000,0')
    end
    it { is_expected.to have_attributes(:coordinates => { lat: 0.02731713374279965,
                                                          lng: 51.59172564827309,
                                                          alt: 0.0 }) }
  end

  describe '#lat' do
    before(:each) { point.coordinates[:lat] = lat }
    it 'return the latitude coordinate' do
      expect(point.lat).to be lat
    end
  end

  describe '#lng' do
    before(:each) { point.coordinates[:lng] = lng }
    it 'return the longitude coordinate' do
      expect(point.lng).to be lng
    end
  end

  describe '#alt' do
    before(:each) { point.coordinates[:alt] = alt }
    it 'return the altitude coordinate' do
      expect(point.alt).to be alt
    end
  end

end
