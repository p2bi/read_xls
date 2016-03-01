# ReadXls

A gem for parsing XLS docs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "read_xls"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install read_xls

## Usage

Simply use the `parse` command to get back a spreadsheet with many sheets. Each spreadsheet contains
a rows method which returns and array or arrays (rows x columns).

```ruby
spreadsheet = ::ReadXls.parse("path/to/spreadsheet.xls")

spreadsheet.sheets.each do |sheet|
  sheet.rows.each do |columns|
    columns.each do |column|
      puts column
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/p2bi/read_xls. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

