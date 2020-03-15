class MathReadAlouds::Book
  @@all = []
  
  attr_accessor :title
  
  def initialize(title)
    @title = title
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
end