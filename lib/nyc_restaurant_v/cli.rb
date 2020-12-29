require 'pry'
class CLI
 
    def start 
        blankspace
        puts "Hello foodie! This is a tool that lets you know a restaurant's grade and violation's located in New York City."
        blankspace
        API.get_data
        main_menu
    end

    def main_menu
        puts "To see a list of all restaurants type list "
        blankspace
        puts "To search for a restaurant by name enter search"
        blankspace
        puts "To leave type exit"
        blankspace
        selection = user_input

        if selection == "list"
            option_1
        elsif selection == "search"
            option_2
        elsif selection == "exit"
            goodbye
        else
           invalid
        end
    end

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
            main_menu
        else @input >= 1
            find_by_index(@input)
        end 
        blankspace
        main_menu
    end

    def find_by_index(input)
        @selected_restaurant = []
        @selected_restaurant << Restaurant.all[input-1] 
        restaurant_details(@selected_restaurant)
    end

    def restaurant_details(restaurant)
        blankspace
        restaurant.each do |attribute|
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            blankspace
            puts "Name: #{attribute.dba}"
            blankspace
            puts "Street: #{attribute.street}"
            blankspace
            puts "Violation: #{attribute.violation_description}"
            blankspace
            if attribute.grade == nil
                puts "Grade: Sorry there is no grade avaliable at this time"
                blankspace
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            else attribute.grade == true
                puts "Grade: #{attribute.grade}"
            blankspace
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            end
        end
    end

    def restaurant_list
        Restaurant.all.each.with_index(0) do |resturant, i|
            puts "#{i+1} - #{resturant.dba} - #{resturant.street}"
        end
    end 
 
    def user_input
        gets.strip
    end

    def invalid
        blankspace
        puts "Your input was invalid, please try again"
        blankspace
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

