module Option_two

    def option_2 
        blankspace
        puts "TYPE IN THE NAME OF THE RESTAURANT THAT YOU WOULD LIKE TO KNOW MORE ABOUT"
        blankspace
        original_input = user_input
        search_by_name = original_input.upcase
        search_result = []
        x = Restaurant.all.each.with_index(0) { |resturant, i| Restaurant.all[i].dba }
        x.select {|y| y.dba}
        f = x.select {|y| y.dba}
        result = f.select {|dba| dba.dba.include?(search_by_name)}  
        if result.size == 1
            restaurant_details(result)
        elsif result.size == 0 
            blankspace
            puts "THE RESTAURANT YOU ARE LOOKING FOR IS CURRENTLY NOT IN THE 1000 RESTAURANT LIMIT IN THIS GEM PLEASE TRY AGAIN"
            blankspace
            main_menu
        else result.size > 1
            result.each.with_index(0) do |resturant, i|
                puts "#{i+1} - #{resturant.dba} - #{resturant.street}"
            end
        blankspace
        puts "TYPE IN THE NUMBER NEXT TO THE RESTURANT TO VIEW ITS FULL PROFILE OTHERWISE TYPE 0 FOR MAIN MENU"
        blankspace
        selection = user_input
        @input = selection.to_i
        if @input == 0
            blankspace
            puts "Taking you back to the main menu either because you entered 0 or your typed something invalid"
            blankspace
        else @input >= 1
            @selected_restaurant = []
            @selected_restaurant << result[@input-1]
            if @selected_restaurant.include?(nil) 
                puts"INVALID NUMBER TRY AGAIN"
            else 
            restaurant_details(@selected_restaurant)
            end
        end 
        blankspace
        main_menu
        end
    end

end

                 
       
