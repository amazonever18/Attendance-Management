require 'factory_bot'
Dir[Rails.root.join('spec/support/factories/*.rb')].each {|f| require f }

User.delete_all

FactoryBot.create(:user)