require 'USD'
require 'net/http'
require 'nokogiri'
#require 'json'
class RefreshUSDCurrencyJob
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform
    #Должно быть динамическое определение адреса порта, но есть только такое
    uri = URI("http://localhost:5000/admin")

    header = {'Content-Type': 'text/json'}
    #body = {
    #    "date": Time.now.strftime("%d.%m.%Y"),
    #    "time": Time.now.strftime("%H:%M"),
    #    "currency": '123'
    #}

    url = 'http://www.cbr.ru/scripts/XML_daily.asp'
    xml_str = Net::HTTP.get_response(URI.parse(url)).body
    doc = Nokogiri::XML(xml_str)
    currency = doc.xpath("string(//Valute[@ID='R01235']/Value)")

    Net::HTTP.post_form(uri, 'date' => Time.now.strftime("%d.%m.%Y"), 'time' => Time.now.strftime("%H:%M"), 'currency' => currency, 'background' => 'true')
  end
end