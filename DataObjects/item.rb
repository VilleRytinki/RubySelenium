class Item
  attr_accessor :name, :description, :price, :quantity, :img_src

  def initialize(name, description, price, quantity, img_src)
    @name = name
    @description = description
    @price = price
    @quantity = quantity
    @img_src = img_src
  end
end
