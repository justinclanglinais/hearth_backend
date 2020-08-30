require 'net/http'
require 'open-uri'
require 'json'
 
class GetCards
 
    URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

    def get_programs
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    url = URI("https://omgvamp-hearthstone-v1.p.rapidapi.com/cards/classes/Warrior")

    def get_cards
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'omgvamp-hearthstone-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = 'b8b42e3fc9mshf1351a8a149b04fp1e9de7jsn551d4560ac41'
        
        response = http.request(request)
        puts response.read_body
    end

    
end
 
cards = GetCards.new.get_cards
puts cards