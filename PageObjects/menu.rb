class Menu
  def initialize(driver)
    @driver = driver
  end

  def reset_app_state
    reset_app_state_button.click
  end

  def reset_app_state_button
    @driver.find_element(id: 'reset_sidebar_link')
  end
end
