class App

    def app_menu
        puts 'Please choose an option by entering a number:'
        puts '1. List all books'
        puts '2. List all people'
        puts '3. Create a person'
        puts '4. Create a book'
        puts '5. Create a rental'
        puts '6. List all rentals for a given person ID'
        puts '7. Exit'
    end

    def start
        app_menu
        @option = gets.chomp

        case @option.to_i
        when 1 # List all books
        list_all_books
        when 2 # List all people
        list_all_people
        when 3 # Create a person
        create_person
        when 4 # Create a book
        create_book
        when 5 # Create a rental
        add_rental
        when 6 # List all rentals a given person ID
        list_rentals_by_person
        else # Exit
        puts 'Goodbye :-)'
        end
    end
end