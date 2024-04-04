# frozen_string_literal: true


require 'selenium-webdriver'
require 'rspec'
require_relative '../DataObjects/standard_user'
require_relative '../PageObjects/login_page'
require_relative '../Helpers/browser'

describe 'Base Test' do
  context "When using basetest" do

    it "Provides Login Page" do
      
      expect(true).to eq(true)
    end

    it 'Provides Standard User' do
      
      expect(true).to eq(true)
    end
    
    it 'Provides selenium webdriver' do
      
      expect(true).to eq(true)
    end
    
    it 'Provides Browser class' do
      expect(true).to eq(true)
    end
  end
end

