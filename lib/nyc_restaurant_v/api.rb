class API
    def self.get_data
        response = RestClient.get('https://data.cityofnewyork.us/resource/43nn-pn8j.json')
        res_array = JSON.parse(response)
            res_array.each do |resturant|
                Restaurant.new(resturant)
        end
    end
end


