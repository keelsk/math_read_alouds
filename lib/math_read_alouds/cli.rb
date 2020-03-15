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
    if valid_input?(chosen_topic, @math_topics)
      display_books(chosen_topic)
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
  
  def display_books(chosen_topic)
    topic = @math_topics[chosen_topic.to_i - 1]
    topic.get_books
    puts "The following books are related to #{topic.name}:"
    topic.books.each.with_index(1) do |book, index|
      puts "#{index}. #{book.title}"
    end
    
    get_selected_book(topic)
  end
  
  def get_selected_book(topic)
    selected_book = gets.chomp
    if valid_input?(selected_book, topic.books)
      display_book_info(selected_book)
    else
      puts "\nPlease input a valid number.\n"
      get_selected_book(topic)
    end
  end
  
  def display_book_info(selected_book)
  end

end