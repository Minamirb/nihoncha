# -*- coding: utf-8 -*-
require 'test_helper'
class WishTest < ActiveSupport::TestCase
  context "#fetch from amazon" do
    setup do
      @wish = Wish.new(:uri => mock_uri)
      @wish.fetch
    end

    should "analize" do
      assert_equal "たのしいRuby 第3版", @wish.name
      assert_equal 2730, @wish.price
      assert_match /Ruby入門書の定番/, @wish.description
      assert_equal "http://ec3.images-amazon.com/images/I/41t7GQ3peRL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA240_SH20_OU09_.jpg", @wish.image_url
    end
  end
end
