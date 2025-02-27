require 'rails_helper'

RSpec.describe Order, type: :model do 
  it 'can create an order with the default factory' do 
    order = create(:order)
    expect(order).to be_valid
    puts "------------"
    puts order.item_name 
    puts "------------"
    puts order.cancelled
    puts "------------"
  end 
end