class MathReadAlouds::Topic
  @@all = []
  
  attr_accessor :name, :books
  
  def initialize(name)
    @name = name
    @books = []
    save
  end
  
  def self.all
    MathReadAlouds::Scraper.scrape_topics if @@all.empty?
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def get_books
    MathReadAlouds::Scraper.scrape_books(self) if @books.empty?
  end
    
end