require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  fixtures :movies

  test "movie attributes must not be empty" do
    movie = Movie.new
    assert movie.invalid?
    assert movie.errors[:code].any?
    assert movie.errors[:name].any?
    assert movie.errors[:year].any?
    assert movie.errors[:genre].any?
    assert movie.errors[:price].any?
    assert movie.errors[:image_url].any?
  end


  test "movie price must be positive" do
    movie = Movie.new(code:      'XXX000',
                      name:      'My movie title',
                      year:      'xxxx',
                      genre:     'Ficion',
                      image_url: 'example.jpg')
    movie.price = -1
    assert movie.invalid?
    assert_equal ["must be greater than or equal to 0"],
      movie.errors[:price]

    movie.price = 0
    assert movie.valid?
  end

  def new_movie(image_url)
    Movie.new(code:      'XXX000',
              name:      'My movie title',
              year:      'xxxx',
              genre:     'Fiction',
              price:     0, 
              image_url: image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
      http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_movie(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_movie(name).invalid?, "#{name} shouldn't be valid"
    end
  end

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
