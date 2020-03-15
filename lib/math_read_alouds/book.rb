class MathReadAlouds::Book
  @@all = []
  
  attr_accessor :title
  
  def initialize(title)
    @title = title
    save
  end
  
  def self.all
    MathReadAlouds::Scraper.scrape_topic_url if @@all.empty?
    #MathReadAlouds::Scraper.scrape_books if @@all.empty?
    @@all
  end
  
  def save
    @@all << self
  end
end