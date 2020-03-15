class MathReadAlouds::Scraper
  
  def self.scrape_topic_url
    topic_url = []
    
    html = open('https://www.k-5mathteachingresources.com/math-read-alouds.html') #Change this and move url to CLI class. Save it as base_url + unique part of url
    doc = Nokogiri::HTML(html)
    
    doc.css("div#ContentWrapper div.ImageBlock.ImageBlockCenter").each do |content|
      link =  content.css("a").attribute("href").value.split('.com')
      page_url = link[1]
      
      topic_url << page_url
    end
    
        binding.pry
  end
  
  def self.scrape_read_alouds(read_aloud_url)
  end
  
  def self.scrape_book_url(book_url)
  end
  
  def self.scrape_prices(amazon_url)
  end
end