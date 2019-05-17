class Cart
  include Mongoid::Document
  
  has_many :line_items, dependent: :destroy

  def total_price
    line_items.to_a.sum { |item| item.movie.price }    
  end
end
