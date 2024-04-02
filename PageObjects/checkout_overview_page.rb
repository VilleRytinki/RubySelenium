require_relative 'order_confirmation_page.rb'

class CheckoutOverviewPage
  def initialize(driver)
    @driver = driver
  end

  def finish
    finish_button.click
    OrderConfirmationPage.new(@driver)
  end

  def finish_button
    @driver.find_element(link_text: 'FINISH')
  end
end