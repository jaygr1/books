# #!/usr/bin/env ruby

# require_relative '../config/environment'

# AutoDetect.new


require 'pry'
require 'json'
require_relative '../adapters/csv_parser'
# require_relative '../adapters/sample_book_json.txt'



class Score

  def values
    file = ('../adapters/genre_keyword.csv')
    keywords = File.readlines(file)
    headers = keywords.shift
    keywords = keywords.map do |line|
      line = line.split(", ")
      line[2] = line[2].to_i
      line = {
        genre: line[0], keyword: line[1], points: line[2]
      }
    end
  end

  def books
    file = ('../adapters/sample_book_json.txt')
    samples = File.read(file)
    novels = JSON.parse(samples)
  end

  # def novel
  #   stories = books.each do |book|
  #   book["title"]
  #   book["description"]
  #   book["title"] = book["description"].gsub(",", "").gsub("-", " ").gsub(".", " ")
  # end


  def count
    books.each do |book|
      book["title"]
      book["description"]
    story = book["description"].gsub(",", "").gsub("-", " ").gsub(".", " ")
    summary = story.split.length
    words = story.split
    i = 0
    genre_value = Array.new
    genre_value << book["title"]
    while i < summary do
      values.each do |line|
        if line[:keyword] == words[i]
          genre_value << {line[:genre] => line[:points]}
        elsif line[:keyword] == "%#{words[i]}%"
            genre_value << {line[:genre] => line[:points]}
        elsif line[:keyword] == "#{words[i]} #{words[i+1]}"
            genre_value << {line[:genre] => line[:points]}
        elsif line[:keyword] == "%#{words[i]}% %#{words[i+1]}%"
          genre_value << {line[:genre] => line[:points]}
        end
      end
      i += 1
      end
      puts genre_value
    end
  end

end

points = Score.new
points.count
