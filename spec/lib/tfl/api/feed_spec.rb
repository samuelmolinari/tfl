require 'spec_helper'

class DummyFeedClass < Struct.new(:app_id, :app_key)
  include Tfl::API::Feed
end

describe Tfl::API::Feed do

  let(:app_id) { 'app_id' }
  let(:app_key) { 'app_key' }
  subject(:feed) { DummyFeedClass.new(app_id, app_key) }

  describe '.fetch_feed' do
    before(:each) do
      @get_url = nil
      @get_options = nil
      ::HTTParty.stub(:get) do |url, options|
        @get_url = url
        @get_options = options
      end
      feed.fetch_feed('http://tfl.gov.uk')
    end

    it 'calls a get request to the given url' do
      expect(@get_url).to eq 'http://tfl.gov.uk'
    end

    it 'passes the app_id and app_key as query options' do
      expect(@get_options[:query]).to eq({app_id: app_id, app_key: app_key})
    end
  end

end
