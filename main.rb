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

    #3. Create a person
    def create_person
        puts "Do you want to create a (1) student or a (2) teacher [input the number]:"
        print "Title: "
        option = gets.chomp.to_i
        
        case option
        when 1
            add_student
        when 2
            add_teacher
        else
            puts "Invalid option selected, please select a valid option"
        end
        
        #Display app main menu
        start_menu
    end

    def add_student
        print "Student age: "
        age = gets.chomp.to_i

        print "Student name: "
        name = gets.chomp

        print "Has parent permission? [Y/N]"
        parent_permission = gets.chomp
        if parent_permission == 'Y'
            parent_permission = true
        else
            parent_permission = false
        end

        @person << Student.new(age,name,parent_permission)
        puts "Student created successfully!!!"

        start_menu
    end

    def add_teacher
        print "Age: "
        age = gets.chomp.to_i

        print "Name: "
        name = gets.chomp

        print "Specialization: "
        specialization = gets.chomp
    
        @person << Teacher.new(age,name,specialization)
        puts "Teacher created successfully!!!"

        start_menu
    end

    #4. Create a book
    def create_book
        print "Title: "
        title = gets.chomp
        print "Author: "
        author = gets.chomp
        @book << Book.new(title, author)
        puts "#{title} by #{author} created successfully!!!";
        
        #Display app main menu
        start_menu
    end

    #5. Create a rental
    def add_rental
        puts "Select the person from the list below [input number]:"
        @people.each_with_index {|person, index| puts "#{index}. #{person.name}" } end

        select_person = gets.chomp.to_i
        person = @people[selected_person]

        puts "Select the book from the list below [input number]:"
        @books.each_with_index {|book, index| puts "#{index}. #{book.title} by #{book.author}" } end

        select_book = gets.chomp.to_i
        book = @people[selected_book]

        print 'Date: '
        date = gets.chomp
        @rentals << Rental.new(date, person, book)

        puts "Rental successfully created !!!"
    end

    #6. List all rentals for a given person ID
    def list_rentals_by_person
        print 'Enter Person ID: '
        person_id =  gets.chomp.to_i
        @people.find { |person| person.id == person_id }.rentals.each do |rental|
        puts rental
        end
    end

end

main = Main.new
main.start_menu()
