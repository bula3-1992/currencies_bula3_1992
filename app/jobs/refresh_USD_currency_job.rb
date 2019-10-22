require 'USD'
require 'setting'
require 'net/http'
require 'nokogiri'
#require 'json'
class RefreshUSDCurrencyJob
  include Sidekiq::Worker

  def perform
    url = 'http://www.cbr.ru/scripts/XML_daily.asp'
    xml_str = Net::HTTP.get_response(URI.parse(url)).body
    doc = Nokogiri::XML(xml_str)
    currency = doc.xpath("string(//Valute[@ID='R01235']/Value)")
    body = {
        "date": Time.now.strftime("%d.%m.%Y"),
        "time": Time.now.strftime("%H:%M"),
        "currency": currency,
        "forced": false
    }
    begin #try for regular
      uri = URI(Setting.uri + "/v1/usd")
      request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body.to_json
      Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
    rescue StandardError => e
      puts e
    end
    begin #try for docker
      uri = URI(Setting.uri.sub("localhost","web") + "/v1/usd")
      request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      request.body = body.to_json
      Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
    rescue StandardError => e
      puts e
    end
    self.class.perform_in(1.minute)
  end
end