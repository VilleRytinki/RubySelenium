class ToolBar
  def initialize(driver)
    @driver = driver
    @menu = Menu.new(driver)
  end


  def menu_button
    @driver.find_element(class: 'bm-burger-button')
  end

  def go_to_shopping_cart
    @driver.find_element(id: 'shopping_cart_container').click
    ShoppingCart.new(@driver)
  end

  def reset_app_state
    menu_button.click
    sleep 0.5
    @menu.reset_app_state
  end
end