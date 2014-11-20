require 'spec_helper'

describe ::Tfl::Station do

  let(:name) { 'South Woodford Station' }
  let(:description) { 'South Woodford Station, London Underground Ltd., George Lane, London, E18 1JJ' }
  let(:point) { ::Tfl::Point.new }

  subject(:station) { described_class.new }

  it { is_expected.to have_attributes(:name => nil,
                                      :description => nil,
                                      :point => nil) }

  context 'when initialized with a hash' do
    subject(:station) do
      described_class.new(name: name, description: description, point: point)
    end

    it { is_expected.to have_attributes(:name => name,
                                        :description => description,
                                        :point => point) }
  end

end
