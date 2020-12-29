require 'pry'
class CLI
 
    def start 
        blankspace
        puts "Hello foodie! This is a tool that lets you know a restaurant's grade and violation's."
        blankspace
        API.get_data
        main_menu
    end

    def main_menu
        blankspace
        puts "To see a list of all restaurants enter 1 "
        puts "To search for a restaurant by name enter 2"
        puts "To leave type exit"
        blankspace
        selection = user_input

        if selection == "1"
            option_1
        elsif selection == "2"
            option_2
        elsif selection == "exit"
            goodbye
        else
           invalid
        end
    end

    def option_1
        restaurant_list
        blankspace
        puts "TYPE IN THE NUMBER NEXT TO THE RESTURANT TO VIEW ITS FULL PROFILE OTHERWISE TYPE back FOR MAIN MENU"
        blankspace
        selection = user_input
        if selection == "back"
            main_menu
        elsif selection =="x"
            restaurant_info
        else
            invalid
        end
    end

    def restaurant_list
        Restaurant.all.each.with_index(0) do |resturant, i|
            puts "#{i+1} - #{resturant.dba} - #{resturant.street}"
        end
    end 

    def restaurant_info
        puts "LETS GET IT STARTED IN HERE"
        binding.pry
    end
 
    def user_input
        gets.strip
    end

    def invalid
        puts "your input was invalid, please try again"
        main_menu
    end

    def option_2 
        puts "option 2"
    end
    
    def blankspace
        puts " "
    end

    def goodbye
        blankspace
        puts"Till next meal, goodbye!"
        blankspace
    end

end
