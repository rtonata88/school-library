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
    else # Exit
      puts 'Goodbye :-)'
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
    if @books.length.zero?
      puts 'No books to display'
    else
      @books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    puts "\n \n"

    # Display app main menu
    start_menu
  end

  # 2. List all people
  def list_all_people
    puts "\n \n"
    if @people.count.zero?
      puts 'No people to display'
    else
      @people.map { |person| puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}" }
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
    parent_permission = (parent_permission_input == 'y')

    @people << Student.new(age, name, parent_permission: parent_permission)
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

    @people << Teacher.new(age, specialization, name)
    puts "\n \n"
    puts 'Teacher created successfully!!!'
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
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
    print 'Select the person from the list above [input number]:'

    selected_person = gets.chomp.to_i
    person = @people[selected_person]

    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title},  Author: #{book.author}"
    end
    print 'Select the book from the list above [input number]:'
    selected_book = gets.chomp.to_i
    book = @books[selected_book]

    print 'Date: '
    date = gets.chomp

    # Add book to rentals
    new_rental = Rental.new(date, person, book)
    @rentals << new_rental
    puts "Rental successfully created !!! \n \n"

    # Display app main menu
    start_menu
  end

  # 6. List all rentals for a given person ID
  def list_rentals_by_person
    puts "\n \n"
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
    person = @rentals.select { |p| p.person.id == person_id }
    # rentals = person.rentals
    person.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}, Author: #{rental.book.author}" }

    # Display app main menu
    start_menu
  end
end

main = Main.new
# student = Student.new(23, nil, "Richard", true)
# puts student.name
main.start_menu
