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

    # def self.search_result_list(search_list)
    #     search_result.each do |resturant|
    #         resturant.each.with_index(0) do |attributes, i|
    #         puts "#{i=1} - #{attributes.dba} - #{attributes.street}"
    #         end
    #     end
    # end
    
    def self.test(something)
     puts 'me'
     binding.pry
    end


end
