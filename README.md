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

## Overriding Styles

Note that if you add in a local style exception in your own application after inheriting from gnar-style, that will completely override gnar-style's defaults. This is particularly important if you're not looking to modify the style at all, but instead are hoping to add to, for example, the list of files excluded.

Consider the following:
```yaml
# In gnar-style/default.yml
Metrics/BlockLength:
  Exclude:
    - 'spec/**/*'
```

```yaml
# In your app's .rubocop.yml
inherit_gem:
  gnar-style:
    - default.yml

Metrics/BlockLength:
  Exclude:
    - specific_file.rb
```

In this example, all files in the spec directory will no longer be excluded from the `Metrics/BlockLength` cop. The excluded array is overridden, and not inherited. This is discussed in [this rubocop issue](https://github.com/bbatsov/rubocop/issues/3208), though the suggestion to have a `super` keyword does not seem to have been implemented.

If you want to add to the list, you'll instead need to add in the prior array elements into your application's `.rubocop.yml` by referencing the initial list from gnar-style.

## Different Styles

gnar-style provides defaults for three different scenarios. You can specify which configuration to use in your `rubocop.yml`. See the [Usage](#usage) section for details.

* `default.yml` - Base styling configurations.
* `default_rails.yml` - Styling for use in a rails project.
* `default_gem.yml` - Styling for use in a gem.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TheGnarCo/gnar-style. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
