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

  def add_to_cart
    add_to_cart_button.click
  end

end
