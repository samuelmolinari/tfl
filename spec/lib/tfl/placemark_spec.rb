require 'spec_helper'

describe ::Tfl::Placemark do

  let(:name) { 'South Woodford Station' }
  let(:description) { 'South Woodford Station, London Underground Ltd., George Lane, London, E18 1JJ' }
  let(:point) { ::Tfl::Point.new }
  let(:style) { ::Tfl::Style.new }

  subject(:station) { described_class.new }

  it { is_expected.to have_attributes(name: nil,
                                      description: nil,
                                      point: nil,
                                      style: nil) }

  context 'when initialized with a hash' do
    subject(:station) do
      described_class.new(name: name,
                          description: description,
                          point: point,
                          style: style)
    end

    it { is_expected.to have_attributes(name: name,
                                        description: description,
                                        point: point,
                                        style: style) }
  end

  describe '#==' do
    it 'returns true when the two stations have the same locations' do
      expect(described_class.new(
                  name: 'Station 1',
                  description: 'Original',
                  point: Tfl::Point.new('1,2,3'))).to eq(
                    described_class.new(
                      name: 'Station 1 (Bis)',
                      description: 'Bis',
                      point: Tfl::Point.new('1,2,3')))

      expect(described_class.new(
                  point: Tfl::Point.new('1,2,3'))).not_to eq(
                    described_class.new(point: Tfl::Point.new('0,2,3')))
    end
  end

end
