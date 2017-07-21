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

This gem includes rubocop, and it's not necessary to separately include rubocop directly in your application's dependencies.

### Inheriting from the gem

Create a `.rubocop.yml` with the following configuration:

```yaml
inherit_gem:
  gnar-style:
    # Choose from one of these three
    - gnar_style/rubocop.yml # if the pure ruby style is all that's needed
    - gnar_style/rubocop_gem.yml # if the application is a gem, already inherits from the default ruby style
    - gnar_style/rubocop_rails.yml # if the application is a rails project, already inherits from the default ruby style
```

To check your application against these style configurations:

```bash
$ bundle exec rubocop
```

You [must](https://github.com/bbatsov/rubocop/blob/master/manual/configuration.md#inheriting-configuration-from-a-dependency-gem) use `bundle exec` when using the `inherit_gem` directive.

### Inheriting from local copies of gem files

Use this approach should you not be able to, or not want to, use the `inherit_gem` directive. This may be because the requirement to use `bundle exec rubocop` to find the dependency's runtime installation path is not an option for you.

There is a command to copy the templates locally:

```bash
$ bundle exec gnar-style copy_local
```

The `copy_local` command accepts a `--format` option to specify what kind of project you have, and therefore, what files you need.

Acceptable options for the format are:
* `ruby` (the default)
* `gem`
* `rails`

You can use this option as follows:
```bash
$ bundle exec gnar-style copy_local --format=gem
```

Create a `.rubocop.yml` with the following configuration:

```yaml
inherit_from:
  # Choose from one of these three
  - "gnar_style/rubocop.yml"  # if the pure ruby style is all that's needed
  - gnar_style/rubocop_gem.yml # if the application is a gem, already inherits from the default ruby style
  - gnar_style/rubocop_rails.yml # if the application is a rails project, already inherits from the default ruby style
```

To check your application against these style configurations:

```bash
$ rubocop
```

Upon updating this gem for any future updates, you'll need to re-run the `copy_local` command to store the updates locally.

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
