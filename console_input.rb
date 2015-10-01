Lecture: Fetching Data from Console

doc = Nokogiri::HTML(open("http://www.rottentomatoes.com/m/the_martian/"))
doc.css('script').remove # To remove all the scripts from the DOM
doc.at("//span[@itemprop = 'name']").text  # Fetch the text from the span element which has an itemprop "name"
doc.at("//span[@itemprop = 'ratingValue']").text.to_i # Fetch the text from the span element which has an itemprop "ratingValue" and convert it to an integer
doc.at_css('#movie-image-section img')['src'] # Fetch the src attribute from the element that has the id "movie-image-section"
doc.at("//td[@itemprop = 'contentRating']").text # Fetch the text from the td element which has an itemprop "contentRating"
doc.at("//td[@itemprop = 'director']").css('a').first.text # Fetch the td element which has an itemprop "director", fetch its link, get the first element's text
doc.at("//span[@itemprop = 'genre']").text # Fetch the text from the span element which has an itemprop "genre"
doc.at("//td[@itemprop = 'datePublished']").text.to_date # Fetch the text from the td element which has an itemprop "datePublished" and convert it into a date format
doc.at("//time[@itemprop = 'duration']").text # Fetch the text from the time element which has an itemprop "duration" 
doc.css('#movieSynopsis').text # Fetch the text from the element with id "movieSynopsis"