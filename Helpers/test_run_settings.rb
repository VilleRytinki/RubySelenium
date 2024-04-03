require 'json'

class TestRunSettings
  attr_reader :browser
  def initialize
    file = File.read(File.dirname(__FILE__) + '/settings.json')
    data = JSON.parse(file)

    @browser = data['browser']
  end
end