# Tfl Gem

[![Build Status](https://travis-ci.org/samuelmolinari/tfl.svg?branch=master)](https://travis-ci.org/samuelmolinari/tfl)
[![Gem Version](https://badge.fury.io/rb/tfl.svg)](http://badge.fury.io/rb/tfl)
[![Code Climate](https://codeclimate.com/github/samuelmolinari/tfl/badges/gpa.svg)](https://codeclimate.com/github/samuelmolinari/tfl)
[![Test Coverage](https://codeclimate.com/github/samuelmolinari/tfl/badges/coverage.svg)](https://codeclimate.com/github/samuelmolinari/tfl)

## Installation

Add this line to your application's Gemfile:

    gem 'tfl'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tfl

## Usage

### Configure client

In order to use the Tfl API, you have to setup your credentials.

#### The block way

```ruby
client = Tfl::Client.new do |config|
  config.app_id = "...",
  config.app_key = "..."
end
```

#### The hash way

```ruby
credientials = {
  :app_id => "...",
  :app_key => "..."
}

client = Tfl::Client.new(credentials)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
