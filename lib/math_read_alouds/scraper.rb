class MathReadAlouds::Scraper
  def self.scrape_topics
    html = open('https://www.k-5mathteachingresources.com/math-read-alouds.html')
    doc = Nokogiri::HTML(html)
    @topic_url = []
    
    doc.css('div#ContentWrapper div.ImageBlock.ImageBlockCenter').each do |content|
      topic = content.css('img').attribute("title").value.split(' ')[0]
      MathReadAlouds::Topic.new(topic)
      
      page_url = content.css("a").attribute("href").value.split('.com')[1]
      @topic_url << page_url if !(@topic_url.include?(page_url))
    end
  end
  
  def self.scrape_books(topic)
    url = @topic_url.select {|url| url.include?(topic.name.downcase)}.join
    html = open('https://www.k-5mathteachingresources.com' + url)
    book_doc = Nokogiri::HTML(html)
    
    book_doc.css("div.responsive-row").each do |book|
      description = book.css('div.responsive_col-3 p').text.strip 
      if description.length > 30
        title = book.css('span b').text.gsub("\n", " ")
        title = book.css('span')[1].text if title == ""
        title = book.css('b').text.split('by')[0] if topic.name == "Geometry"
        
        
        author = book.css('span').first.text.split('by')[1]
        if author == nil
          author = book.css('h4').text.split('by')[1].strip
        else
        author = author.gsub("\n", " ").strip
        end
    
        MathReadAlouds::Book.new(title, author, description, topic)
      end
    end
  end
  
end