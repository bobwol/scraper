Lecture: Fetching Data from Console

doc = Nokogiri::HTML(open("http://www.rottentomatoes.com/m/the_martian/"))
=> Responds with the entire DOM
doc.css('script').remove # To remove all the scripts from the DOM
=> Responds with the javascript removed from DOM
doc.at("//span[@itemprop = 'name']").text  # Fetch the text from the span element which has an itemprop "name"
=> " The Martian (2015)" 
doc.at("//span[@itemprop = 'ratingValue']").text.to_i # Fetch the text from the span element which has an itemprop "ratingValue" and convert it to an integer
=> 91 
doc.at_css('#movie-image-section img')['src'] # Fetch the src attribute from the element that has the id "movie-image-section"
=> "http://resizing.flixster.com/rT6Zrdsk5jerxadzoklaO75zdNo=/180x266/dkpu1ddg7pbsk.cloudfront.net/movie/11/20/23/11202355_ori.jpg"
doc.at("//td[@itemprop = 'contentRating']").text # Fetch the text from the td element which has an itemprop "contentRating"
=> "PG-13 (for some strong language, injury images, and brief nudity)" 
doc.at("//td[@itemprop = 'director']").css('a').first.text # Fetch the td element which has an itemprop "director", fetch its link, get the first element's text
=> "Ridley Scott" 
doc.at("//span[@itemprop = 'genre']").text # Fetch the text from the span element which has an itemprop "genre"
=> "Science Fiction & Fantasy"
doc.at("//td[@itemprop = 'datePublished']").text.to_date # Fetch the text from the td element which has an itemprop "datePublished" and convert it into a date format
=> Fri, 02 Oct 2015 
doc.at("//time[@itemprop = 'duration']").text # Fetch the text from the time element which has an itemprop "duration" 
=> " 2 hr. 14 min."
doc.css('#movieSynopsis').text # Fetch the text from the element with id "movieSynopsis"
=> " During a manned mission to Mars, Astronaut Mark Watney (Matt Damon) is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet. With only meager supplies, he must draw upon his ingenuity, wit and spirit to subsist and find a way to signal to Earth that he is alive. Millions of miles away, NASA and a team of international scientists work tirelessly to bring \"the Martian\" home, while his crewmates concurrently plot a daring, if not impossible rescue mission. As these stories of incredible bravery unfold, the world comes together to root for Watney's safe return. Based on a best-selling novel, and helmed by master director Ridley Scott, THE MARTIAN features a star studded cast that includes Jessica Chastain, Kristen Wiig, Kate Mara, Michael Pe\xF1a, Jeff Daniels, Chiwetel Ejiofor, and Donald Glover. (C) Fox … More  "

Lecture: Generating the Scrape Model

s = Scrape.new
s.scrape_new_movie
=> true
s.title
=> " The Martian (2015)" 

Lecture: Scraping Movies
s = Scrape.new
s.scrape_new_movie
=> true
m = Movie.last
 => Responds with last movie
m.user_id = User.last.id
m.save # Check localhost, see error and add encoding validator in scrape model