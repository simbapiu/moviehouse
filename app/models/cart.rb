class Cart
  include Mongoid::Document
  has_many :line_items, dependent: :destroy
end
