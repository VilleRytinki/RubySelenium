class CustomerInformation
  attr_accessor :firstname, :lastname, :zip

    def initialize(firstname, lastname, zip)
      @firstname = firstname
      @lastname = lastname
      @zip = zip
    end
end