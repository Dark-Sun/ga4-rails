# GA4 Rails

<img src="https://pics.clipartpng.com/midle/Triangle_Under_Construction_Sign_PNG_Clipart-588.png" height=300/>

This is a gem to simplify integration of Rails and Google Analytics 4.


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ga4-rails

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ga4-rails

## Usage

### Basic Usage

Include Ga4Rails model somewhere in your code the following way:

```ruby
  class UserAnalyticsData 
    include Ga4Rails::Model

    metrics :new_users # Specify metrics
    dimensions :browser, :country # Specify dimensions
  end
```

Filters support coming soon!

To fetch data, run the following code:

```ruby
    results = UserAnalyticsData.results(
        access_token: '<access token obtained from Oauth flow'
        property_id: 'properties/<id>',
        start_date: 1.month.ago
        end_date: Date.today
    )
```

### Advanced usage

You can call the API methods directly if you need to.

1. Set up the client

```ruby
require 'ga4-rails/client'

client = Ga4Rails::Client.new(access_token: access_token) # Access token from oauth flow

```

Then you can call methods on `data` or `admin` API directly:

```ruby
client.admin.list_property_data_streams
client.admin.list_account_summaries

client.data.run_property_report(property_id, request)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Roadmap

- [x] Implement wrapper for Google Analytics Admin API
- [x] Implement wrapper for Google Analytics Data API
- [x] Implement Rails model sync extenstion from Data API
- [ ] Implement report filters

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dark-Sun/ga4-rails.
