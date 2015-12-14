require 'csv'
require 'pry'


class Keywords
  def self.parse
      file = ('genre_keyword.csv')
      keywords = File.read(file)
      csv = CSV.new(keywords, headers: true, :header_converters => :symbol)
      csv.to_a.map do |row|
      row.to_hash
    end
  end
end
