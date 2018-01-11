# Pastebinrb

Pastebinrb allows to use the Pastebin API to send Pastebins via Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pastebinrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pastebinrb

## Usage

### Adding the Gem in your Ruby program

```ruby
require 'pastebinrb'
```

### Initializing the Pastebin object

```ruby
p = Pastebinrb::Pastebin.new "devkey"
```
Where **devkey** is replaced by the key provided on Pastebin on this page: [Developers API](https://pastebin.com/api)

### Send a Pastebin

```ruby
p.paste_content("content")
```
Where **content** is the text content you want to send.
Returns the Pastebin URL :

    => "https://pastebin.com/3Kwu11Mv"

#### Send a Pastebin with more options

A list of possible options when sending a Pastebin.

##### :title
The title of the Pastebin sent, not to leave "untitled" by default.

##### :format
The formatting of the Pastebin, by default "text", is used to add syntax highlighting. The list of available formats is in the Pastebin API documentation here: [The 'api_paste_format' Paramater In Detail](https://pastebin.com/api#5)

##### :expire_delay
Set an expiration time for the Pastebin among those available (if unspecified, never by default).
Use the constants defined for this purpose in **Pastebinrb::Expiration**

```ruby
[
  :NEVER,
  :MINUTE_10,
  :HOUR_1,
  :DAY_1,
  :WEEK_1, :WEEK_2,
  :MONTH_1, :MONTH_6,
  :YEAR_1
]
```

##### Examples:

```ruby
p.paste_content(
  "def hello_world; puts \"Hello World !\"; end",
  title: "Hello World",
  format: "ruby",
  expire_delay: Pastebinrb::Expiration::NEVER
)
```
Returns the Pastebin URL :

    => "https://pastebin.com/uSyjtP8z"

### Read a Pastebin

```ruby
p.get_raw("https://pastebin.com/uSyjtP8z")
# or
p.get_raw("uSyjtP8z")
```
Returns the Pastebin content :

    => "def hello_world; puts \"Hello World !\"; end"


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Dakurei/pastebinrb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pastebinrb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Dakurei/pastebinrb/blob/master/CODE_OF_CONDUCT.md).
