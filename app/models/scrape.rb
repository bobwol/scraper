class Scrape
	attr_accessor :title, :hotness, :image_url, :rating, :director,
	:genre, :release_date, :runtime, :synopsis, :failure

	def scrape_new_movie(url)
      begin
         doc = Nokogiri::HTML(open(url))
         doc.css('script').remove
         #    t.string :title
         self.title = doc.at("//span[@itemprop = 'name']").text
         #    t.integer :hotness
         self.hotness = doc.at("//span[@itemprop = 'ratingValue']").text.to_i
         #    t.string :image_url
         self.image_url = doc.at_css('#movie-image-section img')['src']
         #    t.string :rating
         self.rating = doc.at("//td[@itemprop = 'contentRating']").text
         #    t.string :director
         self.director = doc.at("//td[@itemprop = 'director']").css('a').first.text
         #    t.string :genre
         self.genre = doc.at("//span[@itemprop = 'genre']").text
         #    t.date :release_date
         self.release_date = doc.at("//td[@itemprop = 'datePublished']").text.to_date
         #    t.string :runtime
         self.runtime = doc.at("//time[@itemprop = 'duration']").text
         # t.text :synopsis
         s = doc.css('#movieSynopsis').text
         if ! s.valid_encoding?
            s = s.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
         end
         self.synopsis = s
         return true
      rescue Exception => e
      	self.failure = "Something went wrong with the scrape"
      end
   end
end