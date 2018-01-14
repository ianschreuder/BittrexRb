# BittrexRb
Gem to connect to bittrex exchange API.
Please open PRs or issues in order to improve the gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bittrex_rb', git: 'https://github.com/ianschreuder/BittrexRb'
```

And then execute:

    $ bundle

## Configuration

Set your api keys via a loaded config as such:
```
BittrexRb.configure do |config|
  config.api_key     = 'your_api_key'
  config.api_secret  = 'your_api_secret'
end
```

## API Usage
#### Public
```
params: (pair, type)
::BittrexRb::Client.new.public.order_book("BTC-LTC", :buy)
#=> [{quantity: 111, rate: 200}, {quantity: 10, rate: 201}]
```

### Market
#### Set Limit Buy
```
params: (pair, quantity, rate)
::BittrexRb::Client.new.market.buylimit("BTC-LTC", 0.0001, 0.0001)
#=> {uuid: "abc", status: "success}
```

### Account
#### Withdrawal
```
params: (currency, quantity, target_address)
::BittrexRb::Client.new.account.withdraw("BTC", 0.1, '<btc_addy>')
#=> {uuid: "abc", status: "success}
```
#### Balance
```
params: (coin)
::BittrexRb::Client.new.account.balance(coin)
#=> 0.000
```
#### Existing Order
```
params: (uuid)
::BittrexRb::Client.new.account.getorder('xxxx')
#=> {"Quantity"=>0.1,"IsOpen"=>false,<other stuff>}
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bittrex_rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
