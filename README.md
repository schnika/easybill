[![Maintainability](https://api.codeclimate.com/v1/badges/50d989f72ecce4e91ff9/maintainability)](https://codeclimate.com/github/schnika/easybill/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/50d989f72ecce4e91ff9/test_coverage)](https://codeclimate.com/github/schnika/easybill/test_coverage)

# Easybill::Api

This is the ruby wrapper for the easybill REST Api.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easybill-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easybill-api

## Usage

Initialize a new api client:

```
@api = Easybill::Api::Client.new(<YOUR API TOKEN>)
```

Example calls based on the `customers` resource:

```
# Fetch all customers

customers = @api.customers.list["items"]
```

```
# Fetch one customers

customer = @api.customers.find(<ID>)
fist_name = response["first_name"]
```

```
# Create a customer

customer_hash = {
  first_name: "fabio",
  last_name: "lorenzo",
  ...
}

customer = @api.customers.create(customer_hash)
# => 201 created
```

```
# Update a customer

update_customer_hash = {
  country: "UK",
  ...
}

customer = @api.customers.update(<ID>, update_customer_hash)
# => 200 ok
```

```
# Delete a customer

@api.customers.destroy(<ID>)
# => 204 deleted
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/schnika/easybill-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Unlicense

The gem is available as open source under the terms of the [Unlicense](http://unlicense.org).
