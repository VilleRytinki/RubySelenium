require_relative 'checkout_page'
require_relative 'shopping_cart'
require_relative 'checkout_overview_page'
require_relative 'order_confirmation_page'

class CheckoutFacade
  def initialize(driver)
    @shopping_cart_page = ShoppingCart.new(driver)
    @checkout_page = CheckoutPage.new(driver)
    @checkout_overview_page = CheckoutOverviewPage.new(driver)
  end

  def checkout_with(customer_information)
    @shopping_cart_page.proceed_to_checkout
    @checkout_page.fill_customer_information(customer_information)
    @checkout_page.continue_to_order_overview
    @checkout_overview_page.finalize_order
  end
end