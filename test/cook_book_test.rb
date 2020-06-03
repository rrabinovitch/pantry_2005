require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < Minitest::Test
  def test_it_exists
    cookbook = CookBook.new
    assert_instance_of CookBook, cookbook
  end

end
