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
        request["x-rapidapi-key"] = 'b8b42e3fc9mshf1351a8a149b04fp1e9de7jsn551d4560ac41'

        response = http.request(request)
        json = JSON.parse(response.read_body)
        json.collect do |card|
            Card.create(card)
        end
    end

    def cards_format
        cards = JSON.parse(self.get_cards)
        cards.collect do |card|
            card["name"]  
        end
    end
    
end
 
cards = GetCards.new
puts cards.get_cards.uniq