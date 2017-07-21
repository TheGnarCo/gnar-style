# gnar-style

Gnar shared style configurations.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development, :test
  gem 'gnar-style'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gnar-style

## Usage

Create a `.rubocop.yml` with the following configuration:

```yaml
inherit_gem:
  gnar-style:
    - default.yml
```

To check your application against these style configurations:

```bash
$ bundle exec rubocop
```

This gem includes rubocop, and it's not necessary to separately include rubocop directly in your application's dependencies.

## Different Styles

gnar-style provides defaults for three different scenarios. You can specify which configuration to use in your `rubocop.yml`. See the [Usage](#usage) section for details.

* `default.yml` - Base styling configurations.
* `default_rails.yml` - Styling for use in a rails project.
* `default_gem.yml` - Styling for use in a gem.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TheGnarCo/gnar-style. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
