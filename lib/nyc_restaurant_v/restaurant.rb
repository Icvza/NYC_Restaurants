class Restaurant

    @@all = []

    attr_accessor :dba, :street, :violation_description, :grade

    def initialize(resturant_hash)
        resturant_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=", v)
        end
        save
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_dba(search_by_name)
        Restaurant.all.each.with_index(0) do |resturant, i|
            Restaurant.all[i].dba
        end
        binding.pry
    end

    # .include?(search_by_name)

end
