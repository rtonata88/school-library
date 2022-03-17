require './app'

class Main 

  def initialize
    @app = App.new
  end

  def start_menu
    puts 'Please choose an option by entering a number:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person ID'
    puts '7. Exit'
  end

  def main_menu
    start_menu
    @option = gets.chomp

    case @option.to_i
    when 1 # List all books
      @app.list_all_books

      main_menu
    when 2 # List all people
      @app.list_all_people

      main_menu
    when 3 # Create a person
      puts 'Do you want to create a (1) student or a (2) teacher [input the number]: '
      @app.create_person

      main_menu
    when 4 # Create a book
      @app.create_book

      main_menu
    when 5 # Create a rental
      @app.add_rental
      
      main_menu
    when 6 # List all rentals a given person ID
      @app.list_rentals_by_person

      main_menu
    else # Exit
      puts 'Goodbye :-)'
    end
  end
end

app = Main.new
app.main_menu