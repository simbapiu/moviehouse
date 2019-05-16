require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  fixtures :movies
  # test "the truth" do
  #   assert true
  # end
  test "movie is not valid without a unique name" do
    movie = Movie.new(code:      'XXX000',
                      name:      movies(:ruby).name,
                      year:      'xxxx',
                      genre:     'Ficion',
                      image_url: 'example.jpg')
    
    assert movie.invalid?
    assert_equal ["has already been taken"],
      movie.errors[:name]
  end
end
