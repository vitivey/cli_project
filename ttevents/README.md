## Concept and Usage

EventsCLI will be a command-line app that allows users to see a list of upcoming events. When they run the app, they will receive a greeting and will be asked to enter a number corresponding to a prompt. Available prompts will be 'list events', and 'exit'. When user enters 'list', they will receive a list of events that have been scraped from https://buzz.tt/events. From the event list, the user will be asked to enter a number to see the event details or `list` to go back to the list of events. The user will be able to create or edit their own events.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ttevents'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ttevents

## Usage

        1. Load the environment (i.e., ruby bin/events)
        2. Follow the instructions to find events!


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vitivey/cli_project. -->

<!-- # Ttevents

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).




