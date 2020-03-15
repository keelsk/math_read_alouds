class MathReadAlouds::Book
  
  attr_accessor :title, :author, :description, :link, :topic
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
    #MathReadAlouds::Scraper.scrape_read_alouds('https://www.k-5mathteachingresources.com/counting-books.html') if @@all.empty?
    #MathReadAlouds::Scraper.scrape_topic_url if @@all.empty?
    #MathReadAlouds::Scraper.scrape_books if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end
  
  def add_to_topic
    @topic.books << self unless @topic.books.include?(self)
  end
end