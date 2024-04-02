# frozen_string_literal: true

require_relative 'user'

class StandardUser < User
  def initialize
    super('standard_user', 'secret_sauce')
  end
end
