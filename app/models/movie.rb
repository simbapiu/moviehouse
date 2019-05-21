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

  validates :code, :name, :year, :genre, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :name, :code, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

private
  def ensure_not_referenced_by_any_line_item
    return if line_items.present?

    errors.add(:base, 'Line Items present')
    throw :abort
  end

  
end

