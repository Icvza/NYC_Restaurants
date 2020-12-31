module Option_two

    def option_2 
        puts "TYPE IN THE NAME OF THE RESTAURANT THAT YOU WOULD LIKE TO KNOW MORE ABOUT"
        original_input = user_input
        search_by_name = original_input.upcase
        search_result = []
        Restaurant.find_by_dba(search_by_name)
    end

    # def find_by_dba(search_by_name)
    #     Restaurant.all.select do |x|
    #         x.dba == dba.include?(search_by_name)
    #     end
    #     puts "00000jbhfcdxtj"
    # end
    
end