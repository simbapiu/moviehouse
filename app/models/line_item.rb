class LineItem
  include Mongoid::Document
  belongs_to :movie
  belongs_to :cart
end
