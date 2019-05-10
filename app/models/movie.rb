class Movie
  include Mongoid::Document
  field :image_url, type: String
  field :code, type: String
  field :name, type: String
  field :year, type: String
  field :genre, type: String
end

