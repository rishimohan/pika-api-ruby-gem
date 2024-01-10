# PikaApi

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pika_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pika_api

## Usage

### Generate image

Initialise a client

```ruby
require 'pika_api'

client = PikaApi::Client.new('sk-he2jdus1cbz1dpt4mktgjyvx')
```

If you don't have your API key, get one from [Pika.style](https://pika.style).

Check the documentation on [How to get your API key](https://docs.pika.style/docs/basics/getting-api-key).

```ruby
response = client.generate_image_from_template('open-graph-image-1', {'title': 'From python sdk new'}, 'base64')
puts response['data']['base64']
```

**Example:**

`Base64` response format.

```ruby
require 'pika_api'

client = PikaApi::Client.new('sk-he2jdus1cbz1dpt4mktgjyvx')

response = client.generate_image_from_template('open-graph-image-1', {'title': 'From ruby sdk'}, 'base64')
puts response['data']['base64']
```

Base64 output

```
data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABLAAAAJ2CAYAAABPQHtcAAAAAXNSR0IArs4c6QAAIABJREFUeJzs3XmYJXdZL/Bvna37dM90FghLCBAQkC1BCBAMShLFBJAgKnofroBeFUUF5LrhiihXcV8BQRYVUUAlIewIGPbFmLCFLWwCYZEtzPR+trp/TM/......
```

`Binary` response format.

```ruby
require 'pika_api'

client = PikaApi::Client.new('sk-he2jdus1cbz1dpt4mktgjyvx')

File.open("og.png", "w") do |file|
  response = client.generate_image_from_template('open-graph-image-1', {'title': 'From ruby sdk'}, 'binary')
  file.binmode
  file.write(response)
end
```

This example writes the binary image to the file `og.png`.

## generate_image_from_template

Use this function to generate an image. It takes in 3 arguments

| argument | required | description |
|----------|----------|-------------|
|`template_id` | Yes | ID of the template (`open-graph-image-1`, `tweet-image-1`, `beautify-screenshot-1`) |
|`modifications` | Yes | Modifications for the selected template. |
|`response_format` | No | `base64` or `binary` (Defaults to `base64`). |

For available templates and it's modifications refer [image generation api templates](https://pika.style/image-generation-api/templates).

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pika_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PikaApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pika_api/blob/master/CODE_OF_CONDUCT.md).
