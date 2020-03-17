class MathReadAlouds::Book
  
  attr_accessor :title, :author, :description, :topic
  @@all = []
  
  def initialize(title, author, description, topic)
    @title = title
    @author = author
    @description = description
    @topic = topic
    add_to_topic
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def add_to_topic
    @topic.books << self unless @topic.books.include?(self)
  end
end