class Rent
  include Mongoid::Document
  field :price, type: Integer
  field :rent_day, type: Date
  field :return_day, type: Date
  embedded_in :user
  embedded_in :movie
end
