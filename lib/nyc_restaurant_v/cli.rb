require 'pry'
class CLI
    include Style
    include Option_one
    include Option_two
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

    def find_by_index(input)
        @selected_restaurant = []
        @selected_restaurant << Restaurant.all[input-1] 
        restaurant_details(@selected_restaurant)
    end

    def restaurant_details(restaurant)
        blankspace
        restaurant.each do |attribute|
            ui_line
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
                ui_line
            else attribute.grade == true
                puts "Grade: #{attribute.grade}"
            blankspace
            ui_line
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

    def goodbye
        blankspace
        puts"Till next meal, goodbye!"
        blankspace
    end
    
end

