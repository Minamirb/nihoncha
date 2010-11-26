# -*- coding: utf-8 -*-
require 'test_helper'
class WishTest < ActiveSupport::TestCase
  context "#fetch from amazon" do
    setup do
      uri = "http://www.amazon.co.jp/dp/4797357401/ref=sr_1_2?ie=UTF8&qid=1290766740&sr=8-2"
      io = Mock.new
      io.expects(:read => File.read("#{Rails.root}/test/fixtures/amazon_data.html", :encoding => 'UTF-8'))
      Wish.any_instance.stubs(:open).with(uri).returns(io)
      @wish = Wish.new(:uri => uri)
      @wish.fetch
    end

    should "analize" do
      assert_equal "たのしいRuby 第3版", @wish.name
      assert_equal 2730, @wish.price
      assert_match /Ruby入門書の定番/, @wish.description
    end
  end
end
