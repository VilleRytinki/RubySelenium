require_relative 'test_run_settings'

class Browser
  def initialize()
    test_run_settings = TestRunSettings.new
    browser = test_run_settings.browser
    @driver = Selenium::WebDriver.for(browser.to_sym)
  end

  def get(url)
    @driver.get(url)
  end

  def current_url
    @driver.current_url
  end
  
  def find_element(*args)
    @driver.find_element(*args)
  end

  def find_elements(*args)
    @driver.find_elements(*args)
  end

  def url
    @driver.url
  end

  def quit
    @driver.quit
  end
end