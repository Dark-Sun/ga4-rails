# GA4 Rails

<img src="https://pics.clipartpng.com/midle/Triangle_Under_Construction_Sign_PNG_Clipart-588.png" height=300/>

This is a gem to simplify integration of Rails and Google Analytics 4.


## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add ga4-rails

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install ga4-rails

## Usage

### Google Analytics Admin
```ruby
require 'ga4-rails/client'

client = Ga4Rails::Client.new(access_token: access_token)

puts client.admin.list_property_data_streams
puts client.admin.list_account_summaries
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Roadmap

- [x] Implement wrapper for Google Analytics Admin API
- [ ] Implement wrapper for Google Analytics Data API
- [ ] Implement Rails model sync extenstion from Data API

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dark-Sun/ga4-rails.
