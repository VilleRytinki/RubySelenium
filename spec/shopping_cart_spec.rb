# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require_relative '../DataObjects/standard_user'
require_relative '../DataObjects/customer_information'
require_relative '../PageObjects/login_page'
require_relative '../PageObjects/products_page'
require_relative '../PageObjects/checkout_facade'
require_relative '../Helpers/browser'

describe 'Shopping Cart' do
  context 'With one item in shopping cart' do
    before(:example) do
      @driver = Browser.new()
      standard_user = StandardUser.new

      login_page = LoginPage.new(@driver)
      login_page.open
      login_page.login_as(standard_user)

      @products_page = ProductsPage.new(@driver)

      @item_name = 'Sauce Labs Backpack'

      @products_page.go_to_item_page(@item_name)

      @item_page = ItemPage.new(@driver)
      @item_page.add_to_cart

      @shopping_cart_page = @item_page.toolbar.go_to_shopping_cart


      items = @shopping_cart_page.shopping_cart_items

      @first_item_on_list = items.first
    end

    after(:example) do
      @driver.quit
    end
    it 'the name of the item is displayed' do
      expect(@first_item_on_list.name).to eq(@item_name)
    end

    it 'the correct price of the item is displayed' do
      expect(@first_item_on_list.price).to eq('29.99')
    end

    it 'the description of the item is displayed' do
      expect(@first_item_on_list.description).to eq('carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.')
    end

    it 'the correct quantity is displayed' do
      expect(@first_item_on_list.quantity).to eq('1')
    end

    it 'displays the item count in shopping cart icon' do
      item_number = @shopping_cart_page.toolbar.get_item_count_in_shopping_cart_icon

      expect(item_number).to eq('1')
    end

    it 'can continue shopping' do
      @shopping_cart_page.continue_shopping
      page_url = @driver.current_url
      expect(page_url).to eql(@products_page.url)
    end

    it 'removes item from shopping cart' do
      @shopping_cart_page.remove_items
      items = @shopping_cart_page.shopping_cart_items

      expect(items.empty?).to be true
    end

    it 'checkout is successful' do
      firstname = 'Matt'
      lastname = 'Johnston'
      zip = 4231
      customer_information = CustomerInformation.new(firstname, lastname, zip)

      checkout_facade = CheckoutFacade.new(@driver)
      order_confirmation_page = OrderConfirmationPage.new(@driver)

      checkout_facade.checkout_with(customer_information)
      order_confirmation_text = order_confirmation_page.order_confirmation_text

      expect(order_confirmation_text).to eq('Your order has been dispatched, and will arrive just as fast as the pony can get there!')
    end

    context 'When more items are added to the shopping cart' do
      before(:example) do
        @shopping_cart_page.continue_shopping

        @new_item = 'Sauce Labs Bike Light'
        @products_page.go_to_item_page(@new_item)
  
        @item_page.add_to_cart
  
        @item_page.toolbar.go_to_shopping_cart
  
        number_of_items = @shopping_cart_page.toolbar.get_item_count_in_shopping_cart_icon

      end

      it 'increases the number in cart icon when more items are added' do
        number_of_items = @shopping_cart_page.toolbar.get_item_count_in_shopping_cart_icon

        expect(number_of_items).to eq('2')
      end
      
      it 'removes only one item from the cart when removed' do
        @shopping_cart_page.remove_item(@new_item)

        item_count = @shopping_cart_page.shopping_cart_items.count
        sleep 4
        expect(item_count).to eq(1)
      end
      
    end
  end
end
