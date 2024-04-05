# frozen_string_literal: true

require_relative 'menu'
require_relative 'item_page'
require_relative '../DataObjects/item'
require_relative 'header_toolbar'
require 'selenium-webdriver'

class ProductsPage
  attr_accessor :toolbar, :url

  def initialize(driver)
    @driver = driver
    @toolbar = ToolBar.new(driver)
    @url = 'https://www.saucedemo.com/v1/inventory.html'
  end

  def go_to_item_page(item)   
    item_link(item).send_keys(:enter)
    wait = Selenium::WebDriver::Wait.new(timeout: 2, interval: 0.2)
    wait.until { @driver.current_url.include?('inventory-item.html') }
  end

  def add_item_to_shopping_cart(item)
    item_page = go_to_item_page(item)
    item_page.add_to_cart
  end

  def get_details_for(item_name)
    products = list_of_products
    
    products.find { |product| product.name == item_name}
  end


  def list_of_products
    class_prefix = 'inventory_item'
    item_elements = @driver.find_elements(class: class_prefix)
    list_of_product_details = []

    item_elements.each do |item|
      name = item.find_element(class: "#{class_prefix}_name").text
      description = item.find_element(class: "#{class_prefix}_desc").text
      price = item.find_element(class: "#{class_prefix}_price").text
      quantity = '1'
      img_src = item.find_element(class: "#{class_prefix}_img").attribute('src')

      item_details = Item.new(name, description, price, quantity, img_src)

      list_of_product_details.append(item_details)
    end

    list_of_product_details
  end

  def item_link(item)
    @driver.find_element(link_text: item)
  end
end
