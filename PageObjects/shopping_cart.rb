# frozen_string_literal: true
require_relative '../DataObjects/item'
require_relative 'checkout_page'

class ShoppingCart
  def initialize(driver)
    @driver = driver
  end

  def item_elements
    @driver.find_elements(class: 'cart_item')
  end

  def shopping_cart_items
    list_of_item_details = []

    item_elements.each do |item|
      name = item.find_element(class: 'inventory_item_name').text
      description = item.find_element(class: 'inventory_item_desc').text
      price = item.find_element(class: 'inventory_item_price').text
      quantity = item.find_element(class: 'cart_quantity').text
      item_details = Item.new(name, description, price, quantity)
      list_of_item_details.append(item_details)
    end

    list_of_item_details
  end

  def proceed_to_checkout
    checkout_button.click
  end

  def remove_items
    item_elements.each do |element|
      element.find_element(xpath: "//button[contains(text(), 'REMOVE')]").click
    end
  end

  def continue_shopping
    continue_shopping_button.click
  end

  def continue_shopping_button
    @driver.find_element(link_text: 'CONTINUE SHOPPING')
  end
  def checkout_button
    @driver.find_element(link_text: 'CHECKOUT')
  end

end
