# frozen_string_literal: true
require_relative '../DataObjects/item'
require_relative 'checkout_page'

class ShoppingCart
  def initialize(driver)
    @driver = driver
  end

  def shopping_cart_items
    items = @driver.find_elements(class: 'cart_item')
    list_of_item_details = []

    items.each do |item|
      name = item.find_element(class: 'inventory_item_name').text
      description = item.find_element(class: 'inventory_item_desc').text
      price = item.find_element(class: 'inventory_item_price').text
      quantity = item.find_element(class: 'cart_quantity').text
      item_details = Item.new(name, description, price, quantity)
      list_of_item_details.append(item_details)
    end

    list_of_item_details
  end

  def checkout
    checkout_button.click
    CheckoutPage.new(@driver)
  end

  def checkout_button
    @driver.find_element(link_text: 'CHECKOUT')
  end

end
