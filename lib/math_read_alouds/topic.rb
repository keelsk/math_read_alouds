class MathReadAlouds::Topic
  @@all = []
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    MathReadAlouds::Scraper.scrape_topics if @@all.empty?
    @@all
  end
  
  def save 
    @@all << self
  end
    
end