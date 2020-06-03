class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    0 if !@stock.keys.include?(ingredient.name)
  end
end
