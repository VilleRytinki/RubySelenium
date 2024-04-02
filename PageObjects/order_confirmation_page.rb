class OrderConfirmationPage
  def initialize(driver)
    @driver = driver
  end

  def order_confirmation_text
    @driver.find_element(xpath: "//*[contains(@class, 'complete-text')]").text
  end
end