class LineItem
  include Mongoid::Document

  belongs_to :movie
  belongs_to :cart
  
  validates :movie, uniqueness: true
end
