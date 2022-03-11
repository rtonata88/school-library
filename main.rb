require './book'
require './student'
require './teacher'

#Main class
class Main
    def initialize
        @book = [];
        @people = [];
        @rentals = [];
    end

    def start_menu
        app_menu
        @option = gets.chomp
        
        case @option.to_i
            when 1 #List all books
                list_all_books
            when 2 #List all people
                add_person
            when 3 #Create a person
                create_person
            when 4 #Create a book
                create_book
            when 5 #Create a rental
                add_rental
            when 6 #List all rentals a given person ID
                list_rentals_by_person
            when 7 #Exit
                puts "Goodbye :-)"
            else 
                puts "Invalid option selected, please select a valid option"
        end
    end

    def app_menu 
        puts "Please choose an option by entering a number:"
        puts "1. List all books"
        puts "2. List all people"
        puts "3. Create a person"
        puts "4. Create a book"
        puts "5. Create a rental"
        puts "6. List all rentals for a given person ID"
        puts "7. Exit"
    end

    #1. List all books
    def list_all_books
        if @books then @books.each {|book| puts "#{book.title} - #{book.author}" } end
    end

    #2. List all people
    def list_all_people
        if @people then @people.each {|person| puts person } end
    end

end

main = Main.new
main.start_menu()
