# encoding: UTF-8

require 'bundler'

Bundler.setup
Bundler.require

require 'minitest/pride'
require 'minitest/autorun'
require 'minitest/spec'
require 'rack/test'

class MiniTest::Spec
  include Rack::Test::Methods
end
