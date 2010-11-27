ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include Mocha
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def mock_uri
    uri = "http://www.amazon.co.jp/dp/4797357401/ref=sr_1_2?ie=UTF8&qid=1290766740&sr=8-2"
    io = Mock.new
    io.expects(:read => File.read("#{Rails.root}/test/fixtures/amazon_data.html", :encoding => 'UTF-8'))
    Wish.any_instance.stubs(:open).with(uri).returns(io)
    uri
  end
end
