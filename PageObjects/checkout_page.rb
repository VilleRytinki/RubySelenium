require_relative 'checkout_overview_page'

class CheckoutPage
  def initialize(driver)
    @driver = driver
  end

  def firstname_field
    @driver.find_element(id: 'first-name')
  end

  def lastname_field
    @driver.find_element(id: 'last-name')
  end

  def zip_code_field
    @driver.find_element(id: 'postal-code')
  end

  def continue_button
    @driver.find_element(xpath: "//input[@type='submit']")
  end

  def continue
    continue_button.click
    CheckoutOverviewPage.new(@driver)
  end

  def fill_customer_information(customer_information)
    firstname_field.send_keys(customer_information.firstname)
    lastname_field.send_keys(customer_information.lastname)
    zip_code_field.send_keys(customer_information.zip)
  end
end