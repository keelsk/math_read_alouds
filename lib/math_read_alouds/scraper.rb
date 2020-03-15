class MathReadAlouds::Scraper
  def self.scrape_topics
    html = open('https://www.k-5mathteachingresources.com/math-read-alouds.html')
    doc = Nokogiri::HTML(html)
    
    doc.css('div#ContentWrapper div.ImageBlock.ImageBlockCenter').each do |content|
      topic = content.css('img').attribute("title").value.split(' ')[0]
      MathReadAlouds::Topic.new(topic)
    end
  end
  
  
  
  def self.scrape_books(topic)
    MathReadAlouds::Book.new("How many?", topic)
    MathReadAlouds::Book.new("Ten Dots", topic)
  end
  
  
  
  def self.scrape_topic_url
    topic_url = []
    
    html = open('https://www.k-5mathteachingresources.com/math-read-alouds.html') #Change this and move url to CLI class. Save it as base_url + unique part of url
    doc = Nokogiri::HTML(html)
    
    doc.css("div#ContentWrapper div.ImageBlock.ImageBlockCenter").each do |content|
      link =  content.css("a").attribute("href").value.split('.com')
      page_url = link[1]
      
      topic_url << page_url
    end
    topic_url
  end
  
  
  
  def self.scrape_read_alouds(topic_url)
    book_html = open(topic_url)
    book_doc = Nokogiri::HTML(book_html)
    
    book_info = {}
    book_data = []
    additional_book_url = []
    additional_book_url << book_doc.css("div.responsive-row div.ImageBlock.ImageBlockCenter a").attribute('href').text
    
    book_doc.css("div.responsive-row").each do |book|
      description = book.css('div.responsive_col-3 p').text.strip 
      if description.length > 30
        title = book.css('h4 b').text
        author = book.css('h4').text.split('by ')[1]
        
        MathReadAlouds::Book.new(title, author, description)
        
        
        #book_info = {:title => title, :author => author, :description => description}
        #book_data << book_info
      end
    end
    book_data
    binding.pry
  end
  
  
  
  
  def self.scrape_book_url(book_url)
    
  end
  
  
  
  
  def self.scrape_prices(amazon_url)
  end
  
end