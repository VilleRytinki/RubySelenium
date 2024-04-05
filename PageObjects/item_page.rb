# frozen_string_literal: true

require_relative 'shopping_cart'
require_relative 'header_toolbar'

class ItemPage
  attr_accessor :toolbar

  def initialize(driver)
    @driver = driver
    @toolbar = ToolBar.new(driver)
  end

  def add_to_cart_button
    @driver.find_element(xpath: "//button[contains(text(), 'ADD TO CART')]")
  end

  def get_item_details
    class_prefix = 'inventory_details'
    name = @driver.find_element(class: "#{class_prefix}_name").text
    description = @driver.find_element(class: "#{class_prefix}_desc").text
    price = @driver.find_element(class: "#{class_prefix}_price").text
    quantity = nil
    img_src = ''

    item_details = Item.new(name, description, price, quantity, img_src)
  end

  def add_to_cart
    add_to_cart_button.click
  end

end
