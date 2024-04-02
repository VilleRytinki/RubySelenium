require_relative 'checkout_page'
require_relative 'shopping_cart'
require_relative 'checkout_overview_page'
require_relative 'order_confirmation_page'

class CheckoutFacade
  def initialize(driver)
    @shopping_cart_page = ShoppingCart.new(driver)

  end

  def checkout_with(customer_information)
    #TODO: needs redesing to not returning pages
    checkout_page = @shopping_cart_page.checkout
    checkout_page.fill_customer_information(customer_information)
    checkout_overview_page = checkout_page.continue

    order_confirmation_page = checkout_overview_page.finish
  end
end