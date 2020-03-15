require 'pry'

class MathReadAlouds::CLI
  
  def call
    puts "Welcome to Math Read Alouds! Choose a math topic to find literacy connections that can enhance your math instruction!"
    #get_books
    math_topics
    list_topics
    get_user_topic


    
    # get_user_topic
    # get_books_for(topic)
    # display_books
    # get_selected_book
    # display_book_info(selected_book)
    #new = MathReadAlouds::Scraper.new.scrape_topics_page
  end
  
  def math_topics
    @math_topics = MathReadAlouds::Topic.all
  end
  
  def list_topics
    puts "Type the number of the topic you would like to explore:"
    @math_topics.each_with_index do |topic, index|
      puts "#{index + 1}. #{topic.name}"
    end
  end
  
  def get_user_topic
    chosen_topic = gets.chomp
    topic = @math_topics[chosen_topic.to_i - 1] unless chosen_topic == "exit"
    if chosen_topic == "exit"
      exit_program
    elsif valid_input?(chosen_topic, @math_topics)
      display_books(topic)
    else
      puts "\nPlease input a valid number.\n"
      get_user_topic
    end
  end
  
  def valid_input?(input, data)
    input.to_i > 0 && input.to_i <= data.length
  end
  
  # def get_books
  #   MathReadAlouds::Book.new("How Many?")
  #   MathReadAlouds::Book.new("The Water Hole")
  #   MathReadAlouds::Book.all
  #   binding.pry
  # end
  
  def display_books(topic)
    topic.get_books
    puts "The following books are related to #{topic.name}:"
    topic.books.each.with_index(1) do |book, index|
      puts "#{index}. #{book.title}"
    end
    puts "Please select the book you are interested in. Type 'back' to return to previous menu or type 'exit' to leave this program."
    get_selected_book(topic)
  end
  
  def get_selected_book(topic)
    selected_book = gets.chomp
    if selected_book == "exit"
      exit_program
    elsif selected_book == "back"
      display_books(topic)
    elsif valid_input?(selected_book, topic.books)
      display_book_info(topic, selected_book)
    else
      puts "\nPlease input a valid number.\n"
      get_selected_book(topic)
    end
  end
  
  
  
  def display_book_info(topic, selected_book)
    ## you have to change the selected_book from a number to the name of the book.
    ## Can you do this with topic array
    
    index = selected_book.to_i - 1
    puts "TITLE: #{topic.books[index].title}"
    #puts "AUTHOR: #{topic.books[index].author}"
    #puts "DESCRIPTION: #{topic.books[index].description}"
    puts "PRICE(S): " ##You need to scrape from amazon
    puts "     Kindle: "
    puts "     Paperback: "
    puts "     Hardback: "
  end
  
  def exit_program
    puts "Thank you for using Math Read Alouds!"
  end
  
  def run
    
  end

end