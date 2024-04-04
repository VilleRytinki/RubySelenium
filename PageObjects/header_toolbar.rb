class ToolBar
  def initialize(driver)
    @driver = driver
    @menu = Menu.new(driver)
  end

  def shopping_cart_icon
    @driver.find_element(id: 'shopping_cart_container')
  end

  def menu_button
    @driver.find_element(class: 'bm-burger-button')
  end

  def go_to_shopping_cart
    shopping_cart_icon.click
    ShoppingCart.new(@driver)
  end

  def reset_app_state
    menu_button.click
    sleep 0.5
    @menu.reset_app_state
  end

  def get_item_count_in_shopping_cart_icon
    shopping_cart_icon.find_element(xpath: "//*[contains(@class, 'shopping_cart_badge')]").text
  end
end