class Item
  attr_accessor :name, :description, :price, :quantity

  def initialize(name, description, price, quantity)
    @name = name
    @description = description
    @price = price
    @quantity = quantity
  end
end
