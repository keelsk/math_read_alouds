require 'pry'

class MathReadAlouds::CLI
  
  def call
    puts "Welcome to Math Read Alouds! Choose a math topic to find literacy connections that can enhance your math instruction!"
    MathReadAlouds::Book.all
    #get_books
    math_topics
    list_topics
    get_user_topic

    
    # get_user_topic
    # get_books_for(topic)
    # display_books
    # get_selected_book(selected_book)
    # display_book_info(selected_book)
    #new = MathReadAlouds::Scraper.new.scrape_topics_page
  end
  
  def math_topics
    @math_topics = ['Counting', 'Addition', 'Subtraction', 'Multiplication', 'Division', 'Fractions', 'Geometry', 'Measurement']
  end
  
  def list_topics
    puts "Type the number of the topic you would like to explore:"
    @math_topics.each_with_index do |topic, index|
      puts "#{index + 1}. #{topic}"
    end
  end
  
  def get_user_topic
    chosen_topic = gets.chomp
    if valid_input?(chosen_topic, @math_topics)
      display_book_info(chosen_topic)
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
  
  def display_book_info(chosen_topic)
    index = chosen_topic.to_i - 1
    puts "The following books are related to #{@math_topics[index]}:"
    #Book.all.each_with_index(1) do |book|
     # puts
    #end
  end

end