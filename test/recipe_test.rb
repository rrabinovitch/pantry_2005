require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def test_it_exists
    recipe1 = Recipe.new("Mac and Cheese")
    assert_instance_of Recipe, recipe1
  end

  def test_it_has_name
    recipe1 = Recipe.new("Mac and Cheese")
    assert_equal "Mac and Cheese", recipe1.name
  end

  def test_it_starts_w_no_ingreds
    recipe1 = Recipe.new("Mac and Cheese")
    assert_equal ({}), recipe1.ingredients_required
  end

  def test_it_can_add_ingreds
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)
    expected_req_ingreds = {
      ingredient1 => 6,
      ingredient2 => 8
    }

    assert_equal expected_req_ingreds, recipe1.ingredients_required
    # if time separate ingredients_required & add_ingredients test
  end

  def test_it_can_list_ingreds
    recipe1 = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient1, 4)
    recipe1.add_ingredient(ingredient2, 8)

    assert_equal [ingredient1, ingredient2], recipe1.ingredients
  end

  def test_it_can_calculate_total_cals
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

    assert_equal 440, recipe1.total_calories
    assert_equal 675, recipe2.total_calories
  end
end



pantry = Pantry.new
# => #<Pantry:0x007fd8858863b8...>

cookbook = CookBook.new
# => #<CookBook:0x00007faae6a42228 @recipes=[]>

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

ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
# => #<Ingredient:0x00007faae694bb80...>

recipe2 = Recipe.new("Cheese Burger")
# => #<Recipe:0x00007faae692a110...>

recipe2.add_ingredient(ingredient1, 2)

recipe2.add_ingredient(ingredient3, 4)

recipe2.add_ingredient(ingredient4, 1)

recipe1.total_calories
# => 440

recipe2.total_calories
# => 675

cookbook.add_recipe(recipe1)

cookbook.add_recipe(recipe2)

cookbook.ingredients
# => ["Cheese", "Macaroni", "Ground Beef", "Bun"]

cookbook.highest_calorie_meal
# => #<Recipe:0x00007faae692a110...>

pantry.restock(ingredient1, 5)

pantry.restock(ingredient1, 10)

pantry.enough_ingredients_for?(recipe1)
# => false

pantry.restock(ingredient2, 7)

pantry.enough_ingredients_for?(recipe1)
# => false

pantry.restock(ingredient2, 1)

pantry.enough_ingredients_for?(recipe1)
# => true
