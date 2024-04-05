# frozen_string_literal: true


require 'selenium-webdriver'
require 'rspec'
require_relative '../DataObjects/standard_user'
require_relative '../PageObjects/login_page'
require_relative '../PageObjects/products_page'
require_relative '../PageObjects/item_page'
require_relative '../Helpers/browser'

describe 'Item Page' do
  context 'When navigating to item page from products page' do
    @driver = Browser.new
    standard_user = StandardUser.new

    login_page = LoginPage.new
    login_page.login_as(standard_user)

    @products_page = ProductsPage.new(@driver)

    @item_name = 'Sauce Labs Bolt T-Shirt'

    @products_page_item_description = @products_page.get_item_description(@item_name)
    @products_page_item_price = @products_page.get_item_price(@item_name)
    @products_page_item_img_src = @products_page.get_item_img_src(@item_name)

    @products_page.go_to_item_page(item)

    @item_page = ItemPage.new(@driver)

    @item_page_item_name = @item_page.get_item_name
    @item_page_item_description = @item_page.get_item_description
    @item_page_item_price = @item_page.get_item_price
    @item_page_item_img_src = @item_page.get_item_img_src

    it 'has the same image source' do
      expect(@item_page_item_img_src).to eq(@products_page_item_img_src)
    end

    it 'has the same item name' do
      expect(@item_page_item_name).to eq(@item_name)
    end
    
    it 'has the same item price' do
      expect(@item_page_item_price).to eq(@products_page_item_price)
    end

    it 'has the same description' do
      expect(@item_page_item_description).to eq(@products_page_item_description)
    end
  end
end