# -*- coding: utf-8 -*-
class Wish < ActiveRecord::Base
  belongs_to :user

  def fetch
    html = nil
    doc = Nokogiri::HTML(open(uri).read)
    self.name = doc.xpath('//title').first.text.split(/\s*[:：]\s*/)[1]
    self.price = doc.xpath("//b[@class='priceLarge']").first.text.slice(/[\d,]+/).delete(',').to_i
    self.description = doc.xpath("//div[@class='productDescriptionWrapper']").first.text
  end

end
