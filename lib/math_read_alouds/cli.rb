require 'pry'

class MathReadAlouds::CLI
  
  def call
    puts "Welcome to Math Read Alouds! Choose a math topic to find literacy connections that can enhance your math instruction!".green
    math_topics
    list_topics

  end
  
  def math_topics
    @math_topics = MathReadAlouds::Topic.all
  end
  
  def list_topics
    @math_topics.each.with_index(1) do |topic, index|
      puts "#{index}. #{topic.name}"
    end
    get_user_topic
  end
  
  def get_user_topic
    puts "Enter a ".green + "TOPIC NUMBER ".red + "or type ".green +  "'EXIT' ".red +  "to leave this program.".green
    chosen_topic = gets.chomp
    chosen_topic = chosen_topic.downcase
    topic = @math_topics[chosen_topic.to_i - 1] unless chosen_topic == "exit"
    if chosen_topic == "exit"
      exit_program
    elsif valid_input?(chosen_topic, @math_topics)
      display_books(topic)
    else
      puts "Please input a valid number.\n".green
      get_user_topic
    end
  end
  
  def valid_input?(input, data)
    input.to_i > 0 && input.to_i <= data.length
  end
  
  def display_books(topic)
    topic.get_books
    puts "The following books are related to #{topic.name}:".green
    topic.books.each.with_index(1) do |book, index|
      puts "#{index}. #{book.title}"
    end
    puts "Please select the ".green + "BOOK NUMBER ".red + "you are interested in, type ".green + "'BACK' ".red + "to return to the previous menu, or type ".green + "'EXIT' ".red + "to leave this program.".green
    get_selected_book(topic)
  end
  
  def get_selected_book(topic)
    selected_book = gets.chomp
    selected_book = selected_book.downcase
    if selected_book == "exit"
      exit_program
    elsif selected_book == "back"
      list_topics
    elsif valid_input?(selected_book, topic.books)
      display_book_info(topic, selected_book)
    else
      puts "Please input a valid number.\n".green
      get_selected_book(topic)
    end
  end
  
  def display_book_info(topic, selected_book)
    index = selected_book.to_i - 1
    puts "TITLE:".red.bold + " #{topic.books[index].title}"
    puts "AUTHOR:".red.bold + " #{topic.books[index].author}"
    puts "DESCRIPTION:".red.bold + " #{topic.books[index].description}"
    user_decision
  end
  
  def user_decision
    puts "Would you like to find another book? (y/n)"
    input = gets.chomp.downcase
    
    if input == "y"
      call
    elsif input == "n"
      exit_program
    else
      puts "Please enter a valid answer."
      user_decision
    end
  end
  
  def exit_program
    puts "Thank you for using Math Read Alouds!".red
  end

end