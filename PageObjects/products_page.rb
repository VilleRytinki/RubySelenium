# frozen_string_literal: true

require_relative 'menu'
require_relative 'item_page'
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
    ItemPage.new(@driver)
  end

  def item_link(item)
    @driver.find_element(link_text: item)
  end
end
