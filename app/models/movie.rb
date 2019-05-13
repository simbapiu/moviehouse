class Movie
  include Mongoid::Document
  field :image_url, type: String
  field :code, type: String
  field :name, type: String
  field :year, type: String
  field :genre, type: String
  field :price, type: Integer

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

private
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end

  
end

