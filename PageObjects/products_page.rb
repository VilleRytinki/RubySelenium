# frozen_string_literal: true

require_relative 'menu'
require_relative 'item_page'
require_relative 'header_toolbar'
require 'selenium-webdriver'

class ProductsPage
  attr_accessor :toolbar

  def initialize(driver)
    @driver = driver
    @toolbar = ToolBar.new(driver)
  end

  def go_to_item_page(item)   
    item_link(item).send_keys(:enter)
    ItemPage.new(@driver)
  end

  def item_link(item)
    @driver.find_element(link_text: item)
  end
end
