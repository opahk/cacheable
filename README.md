# Cacheable

[![Build Status](https://travis-ci.org/opahk/cacheable.png?branch=master)](https://travis-ci.org/opahk/cacheable)
[![Coverage Status](https://coveralls.io/repos/opahk/cacheable/badge.png)](https://coveralls.io/r/opahk/cacheable)
[![Code Climate](https://codeclimate.com/github/opahk/cacheable.png)](https://codeclimate.com/github/opahk/cacheable)

Cacheable is a lightweight, db-agnostic low-level caching mechanism for Rails.

## Installation

Add this line to your application's Gemfile:

    gem 'cacheable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cacheable

## Usage

In your model, do something like this

    class MyModel
      include Cacheable
      def my_method
        ...
      end
      cacheable :my_method
    end

It also works for class methods

    class MyModel
      include Cacheable
      def self.my_method
        ...
      end
      class_cacheable :my_method
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
