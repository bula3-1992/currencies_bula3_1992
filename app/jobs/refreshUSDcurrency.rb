require 'net/http'
require 'nokogiri'
require 'USD'

class RefreshUSDCurrency
  include Sidekiq::Worker

  def perform
    puts 'updated'
    url = 'http://www.cbr.ru/scripts/XML_daily.asp'
    xml_str = Net::HTTP.get_response(URI.parse(url)).body
    doc = Nokogiri::XML(xml_str)
    currency = doc.xpath("string(//Valute[@ID='R01235']/Value)")
    USD.update currency
    self.class.perform_in(1.minute)
  end
end