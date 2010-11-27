# -*- coding: utf-8 -*-
class Wish < ActiveRecord::Base
  belongs_to :user

  def fetch
    html = nil
    doc = Nokogiri::HTML(open(uri).read)
    if title = doc.xpath('//title').first
      self.name = title.text.split(/\s*[:：]\s*/)[1]
    end
    if price = (doc.xpath("//b[@class='priceLarge']").first || doc.xpath("//span[@class='price']").first)
      self.price = price.text.slice(/[\d,]+/).delete(',').to_i
    end
    if description = doc.xpath("//div[@class='productDescriptionWrapper']").first
      self.description = description.text
    end
  end

end
