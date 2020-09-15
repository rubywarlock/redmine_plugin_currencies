require "net/http"

module Currencies
  extend ActiveSupport::Concern

  def load_currencies
    currency = Currency.last

    if currency&.updated_at != DateTime.now
      begin
        url = URI.parse(URI.escape("http://www.cbr.ru/scripts/XML_daily.asp"))
        page = Nokogiri::XML(Net::HTTP.get(url))

        page.xpath("ValCurs/Valute").each do |valute|
          code = valute.xpath("CharCode").text
          rate = valute.xpath("Value").text
          name = valute.xpath("Name").text

          currency = Currency.find_or_create_by!(code: code, name: name)
          currency.update!(rate: rate)
        end
      rescue Exception => e
        puts "Error CONNECT. Message: #{e.message}"
      end
    end

  end
end