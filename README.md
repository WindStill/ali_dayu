# AliDayu

阿里大鱼的短信、语音发送

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ali_dayu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ali_dayu

## Usage


AliDayu.app_key = "23451281"
AliDayu.app_secret = "111d361c4d222badaaa759d2bddc8888"
AliDayu.post_url = "http://gw.api.taobao.com/router/rest"
AliDayu.sms_send('18600251122', {code: '123456', product: ''}, 'SMS_11585207', '进货宝')
AliDayu.voice_send('18600251122', {product: '', code: '123456'}, 'TTS_22511215', '051482043260')

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ali_dayu.

