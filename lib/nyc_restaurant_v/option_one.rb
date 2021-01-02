module Option_one

    def option_1
        blankspace
        restaurant_list
        blankspace
        puts "TYPE IN THE NUMBER NEXT TO THE RESTURANT TO VIEW ITS FULL PROFILE OTHERWISE TYPE 0 FOR MAIN MENU"
        blankspace
        selection = user_input
        @input = selection.to_i 
        if @input == 0
            puts "Taking you back to the main menu either because you entered 0 or your typed something invalid" 
        else @input >= 1
            find_by_index(@input)
        end 
        blankspace
        main_menu
    end

end
