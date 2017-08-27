# Cykl

View the cycle-time of your Github issues

Cykl uses the Github API via Octokit to pull information on at least the last 50 closed
issues in your repo. Currently, you can track the average lifetime of those issues.

### Upcoming

- How long issues have spent in a particular column on your project
board (if the board is connected to Github)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cykl', '~> 0.1.4'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cykl

## Usage

First, be sure to have your Github login details in a `.netrc` in your root directory

- Just call `cykl` with no arguments to return at least the
 last 50 closed issues assigned to you

- Or `cykl 'owner/repo'` to return at least the last 50
 closed issues from a specific repository

#### Options

`--label`

- You can provide a label to scope your return to issues only
 containing the given label, like so: `--label '<your repo label>'`.
 You can also pass `-l`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Baron-burton/cykl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

