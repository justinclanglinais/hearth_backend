require 'net/http'
require 'open-uri'
require 'json'
 
class GetCards
    
    def get_cards
        url = URI("https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/classes/Warrior")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'omgvamp-hearthstone-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = ENV['API_KEY']

        response = http.request(request)
        json = JSON.parse(response.read_body)
        json.collect do |card|
            puts card["name"]
        end
    end
    
end
 
cards = GetCards.new
puts cards.get_cards.uniq