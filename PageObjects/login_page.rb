# frozen_string_literal: true

class LoginPage
  def initialize(driver)
    @driver = driver
    @url = 'https://www.saucedemo.com/v1/index.html'
  end

  def open
    @driver.get(@url)
  end

  def login_as(user)
    username_element.send_keys(user.username)
    password_element.send_keys(user.password)

    login_button.click
  end

  def username_element
    @driver.find_element(id: 'user-name')
  end

  def password_element
    @driver.find_element(id: 'password')
  end

  def login_button
    @driver.find_element(id: 'login-button')
  end
end
