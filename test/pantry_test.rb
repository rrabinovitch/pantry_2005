require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
# require './lib/cook_book' # NOT SURE IF NEEDED YET
require './lib/pantry'

class PantryTest < Minitest::Test
  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_it_starts_with_empty_stock
    pantry = Pantry.new
    assert_equal ({}), pantry.stock
  end

  def test_it_can_check_stock
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    assert_equal 0, pantry.stock_check(ingredient1)
  end

  def test_it_can_restock
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal 15, pantry.stock_check(ingredient1)

    pantry.restock(ingredient2, 7)
    assert_equal 7, pantry.stock_check(ingredient2)
  end

  def test_enough_ingredients_for
    pantry = Pantry.new
    # cookbook = CookBook.new # not sure if needed
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 1)
    # cookbook.add_recipe(recipe1) # not sure if needed
    # cookbook.add_recipe(recipe2) # not sure if needed
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal false, pantry.enough_ingredients_for?(recipe1)

    pantry.restock(ingredient2, 7)
    assert_equal false, pantry.enough_ingredients_for?(recipe1)

    pantry.restock(ingredient2, 1)
    assert_equal true, pantry.enough_ingredients_for?(recipe1)
  end
end


cookbook = CookBook.new
# => #<CookBook:0x00007faae6a42228 @recipes=[]>

# The 'date' method should return the date the cookbook is created as "mm-dd-yyyy"
cookbook.date
# => "04-22-2020"

ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
# => #<Ingredient:0x00007faae6a207e0...>

ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
# => #<Ingredient:0x00007faae69e3cf0...>

recipe1 = Recipe.new("Mac and Cheese")
# => #<Recipe:0x00007faae69c9698...>

recipe1.add_ingredient(ingredient1, 2)

recipe1.add_ingredient(ingredient2, 8)

ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
# => #<Ingredient:0x00007faae6950860...>

ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
# => #<Ingredient:0x00007faae694bb80...>

recipe2 = Recipe.new("Burger")
# => #<Recipe:0x00007faae692a110...>

recipe2.add_ingredient(ingredient3, 4)

recipe2.add_ingredient(ingredient4, 100)

cookbook.add_recipe(recipe1)

cookbook.add_recipe(recipe2)

cookbook.summary
# => [{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}]
