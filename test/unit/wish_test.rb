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
    end
  end
end
