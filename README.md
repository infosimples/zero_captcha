Developed by [Infosimples](https://infosimples.com), a brazilian company that
offers [data extraction solutions](https://infosimples.com/en/data-engineering)
and [Ruby on Rails development](https://infosimples.com/en/software-development).


# ZeroCaptcha

ZeroCaptcha is a Ruby API for an enterprise captcha solving service developed by
Infosimples that is 100% powered by artificial intelligence software.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zero_captcha', '~> 1.0.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zero_captcha


## Usage

1. **Create a client**

  ```ruby
  # Create a client
  #
  client = ZeroCaptcha.new('mytoken')
  ```

2. **Solve a captcha**

  There are two methods available: **decode** and **decode!**
    * **decode** doesn't raise exceptions.
    * **decode!** may raise a *ZeroCaptcha::Error* if something goes wrong.

  If the solution is not available, an empty captcha object will be returned.

  ```ruby
  captcha = client.decode(url: 'http://bit.ly/1xXZcKo', solver: 'captcha-type-1')
  captcha.text        # Solution of the captcha
  captcha.id          # Numeric ID of the captcha solved by ZeroCaptcha
  captcha.correct?    # true if the solution is correct
  captcha.duration    # How long it took to solve the captcha in milliseconds.
  ```

  You can also specify *path*, *file*, *raw* and *raw64* when decoding an image.

  ```ruby
  client.decode(path: 'path/to/my/captcha/file', solver: 'captcha-type-1')

  client.decode(file: File.open('path/to/my/captcha/file', 'rb'), solver: 'captcha-type-1')

  client.decode(raw: File.open('path/to/my/captcha/file', 'rb').read, solver: 'captcha-type-1')

  client.decode(raw64: Base64.encode64(File.open('path/to/my/captcha/file', 'rb').read), solver: 'captcha-type-1')
  ```

  > Internally, the gem will always convert the image to raw64 (binary base64 encoded).

3. **Report incorrectly solved captcha for refund**

  ```ruby
  captcha = client.report_incorrect(130920620) # with 130920620 as the captcha id
  ```

  > ***Warning:*** *do not abuse on this method, otherwise you may get banned*

4. **Report correctly solved captcha for statistics**

  ```ruby
  captcha = client.report_correct(130920620) # with 130920620 as the captcha id
  ```

## Notes

#### Thread-safety

The API is thread-safe, which means it is perfectly fine to share a client
instance between multiple threads.

#### Ruby dependencies

ZeroCaptcha don't require specific dependencies. That saves you memory and
avoid conflicts with other gems.

#### Input image format

Any format you use in the decode method (url, file, path, raw, raw64) will
always be converted to a raw64, which is a binary base64 encoded string. So, if
you already have this format available on your side, there's no need to do
convertions before calling the API.

> Our recomendation is to never convert your image format, unless needed. Let
> the gem convert internally. It may save you resources (CPU, memory and IO).

#### Versioning

ZeroCaptcha gem uses [Semantic Versioning](http://semver.org/).

#### Ruby versions

This gem has been tested with the following versions of Ruby:

* MRI 2.2.2
* MRI 2.2.0
* MRI 2.1.5
* MRI 2.0.0
* MRI 1.9.3

# Maintainers

* [Rafael Barbolo](http://github.com/barbolo)


## Contributing

1. Fork it ( https://github.com/infosimples/zero_captcha/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. **Run/add tests (RSpec)**
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
7. Yay. Thanks for contributing :)

All contributors:
https://github.com/infosimples/zero_captcha/graphs/contributors


# License

MIT License. Copyright (C) 2011-2015 Infosimples. https://infosimples.com/
