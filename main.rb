require './book'
require './person'
require './student'
require './teacher'
require './rental'

# Main class
class Main
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def start_menu
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
    when 7 # Exit
      puts 'Goodbye :-)'
    else
      puts 'Invalid option selected, please select a valid option'
    end
  end

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

  # 1. List all books
  def list_all_books
    puts "\n \n"
    if @books.length > 1
    then @books.each { |book| 
        puts "#{book.title} - #{book.author}" }
    else 
        puts 'No books to display'
    end
    puts "\n \n"

    # Display app main menu
    start_menu
  end

  # 2. List all people
  def list_all_people
    puts "\n \n"
    if @people.length > 1 
    then @people.each  {|person|
         "[#{person.class.name}] - #{person.name} (#{person.age})"}
    else
        puts 'No people to display' 
    end
    puts "\n \n"

    # Display app main menu
    start_menu
  end

  # 3. Create a person
  def create_person
    puts 'Do you want to create a (1) student or a (2) teacher [input the number]: '
    option = gets.chomp.to_i

    case option
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Invalid option selected, please select a valid option'
    end

    # Display app main menu
    start_menu
  end

  def add_student
    print 'Student age: '
    age = gets.chomp.to_i

    print 'Student name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp.downcase
    parent_permission = true;
    if parent_permission_input == 'y'
    then parent_permission = true 
    else parent_permission = false
    end

    @people << Student.new(age, name, parent_permission)
    puts "\n \n"
    puts 'Student created successfully!!!'
    puts "\n \n"

    start_menu
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @people << Teacher.new(age, name, specialization)
    puts "\n \n"
    puts 'Student created successfully!!!'
    puts "\n \n"
    start_menu
  end

  # 4. Create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "#{title} by #{author} created successfully!!!"

    # Display app main menu
    start_menu
  end

  # 5. Create a rental
  def add_rental
    puts "\n"
    @people.each_with_index do |person, index|
      puts "#{index}. #{person.name}"
    end
    puts "\n"
    print 'Select the person from the list below [input number]:'

    selected_person = gets.chomp.to_i
    person = @people[selected_person]

    @books.each_with_index do |book, index|
      puts "#{index}. #{book.title} by #{book.author}"
    end
    print 'Select the book from the list above [input number]:'
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    print 'Date: '
    date = gets.chomp

    # Add book to rentals
    book.add_rentals(date, person)

    puts "Rental successfully created !!! \n \n"

    # Display app main menu
    start_menu
  end

  # 6. List all rentals for a given person ID
  def list_rentals_by_person
    puts "\n \n"
    puts @people
    if @people.length
      @people.each do |person|
        puts "[#{person.class.name}] - ID: #{person.id}, Name: #{person.name}, Age: (#{person.age})"
      end
    else
      puts 'No people to display'
    end
    puts "\n \n"
    print 'Enter Person ID: '
    person_id = gets.chomp.to_i
    person = @people.select { |p| p.id == person_id }
    rentals = person.person_rentals
    rentals.each { |rental| puts rental }

    # Display app main menu
    start_menu
  end
end

main = Main.new
# student = Student.new(23, nil, "Richard", true)
# puts student.name
main.start_menu
