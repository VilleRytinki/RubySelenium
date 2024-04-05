# frozen_string_literal: true


require 'selenium-webdriver'
require 'rspec'
require_relative '../DataObjects/standard_user'
require_relative '../DataObjects/item'
require_relative '../PageObjects/login_page'
require_relative '../PageObjects/products_page'
require_relative '../PageObjects/item_page'
require_relative '../Helpers/browser'

describe 'Item Page' do
  context 'When navigating to item page from products page' do
    before(:example) do
      @driver = Browser.new()
      standard_user = StandardUser.new()

      login_page = LoginPage.new(@driver)
      login_page.open
      login_page.login_as(standard_user)

      @products_page = ProductsPage.new(@driver)

      @item_name = 'Sauce Labs Bolt T-Shirt'

      @products_page_item_details = @products_page.get_details_for(@item_name)

      @products_page.go_to_item_page(@item_name)

      @item_page = ItemPage.new(@driver)
      @item_page_item_details = @item_page.get_item_details

    end

    after(:example) do
      @driver.quit
    end

    it 'has the same image source' do
      expect(@item_page_item_details.img_src).to eq(@products_page_item_details.img_src)
    end

    it 'has the same item name' do
      expect(@item_page_item_details.name).to eq(@products_page_item_details.name)
    end
    
    it 'has the same item price' do
      expect(@item_page_item_details.price).to eq(@products_page_item_details.price)
    end

    it 'has the same description' do
      expect(@item_page_item_details.description).to eq(@products_page_item_details.description)
    end
  end
end