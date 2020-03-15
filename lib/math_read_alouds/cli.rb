require 'pry'

class MathReadAlouds::CLI
  
  attr_accessor :scraper
  
  def call
    puts "Welcome to Math Read Alouds! Choose a math topic to find literacy connections that can enhance your math instruction!"
    
    list_topics
    
    # get_user_topic
    # get_books_for(topic)
    # display_books
    # get_selected_book(selected_book)
    # display_book_info(selected_book)
    #new = MathReadAlouds::Scraper.new.scrape_topics_page
  end
  
  def list_topics
    math_topics = ['Counting', 'Addition', 'Subtraction', 'Multiplication', 'Division', 'Fractions', 'Geometry', 'Measurement']
    puts "Type the number of the topic you need literacy connections for:"
    math_topics.each_with_index do |topic, index|
      puts "#{index + 1}. #{topic}"
    end
  end
  
  def get_user_topic
    puts "Type the number of the topic you would like to explore:"
    @input = gets.chomp
  end
  
  
end