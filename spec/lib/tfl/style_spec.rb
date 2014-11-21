require 'spec_helper'

describe ::Tfl::Style do

  subject(:style) { described_class.new }

  it { is_expected.to have_attributes(id: nil,
                                      icon: nil) }

  context 'initialized with arguments' do
    let(:id) { 'tubeStyle' }
    let(:icon) { 'http://www.tfl.gov.uk/tfl-global/images/syndication/roundel-tube.png' }
    subject(:style) { described_class.new(id, icon) }

    it { is_expected.to have_attributes(id: id,
                                        icon: icon) }
  end

  describe '#==' do
    it 'returns true when ids match' do
      expect(described_class.new('dlrStyle','icon1')).to eq(
                                      described_class.new('dlrStyle','icon2'))

      expect(described_class.new('tubeStyle','icon2')).not_to eq(
                                      described_class.new('dlrStyle','icon2'))
    end
  end

end
