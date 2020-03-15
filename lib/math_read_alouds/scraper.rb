require 'nokogiri'
require 'open-uri'
require 'pry'

class MathReadAlouds::Scraper
  
  def self.scrape_topics_page
    html = open('https://www.k-5mathteachingresources.com/math-read-alouds.html') #Change this and move url to CLI class. Save it as base_url + unique part of url
    doc = Nokogiri::HTML(html)
    
        binding.pry
  end
  
  def self.scrape_read_alouds(read_aloud_url)
  end
  
  def self.scrape_book_url(book_url)
  end
  
  def self.scrape_prices(amazon_url)
  end
end