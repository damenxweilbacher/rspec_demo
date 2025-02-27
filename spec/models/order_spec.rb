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

  it 'cannot create an order if item_name is nil' do 
    order = Order.new(item_name: nil, cancelled: true)
    expect(order).to be_invalid
    puts "----------"
    puts order.item_name
    puts "----------" 
    puts "status: #{order.cancelled}"
    puts "----------"
  end 

  describe 'scopes' do
    describe '.cancelled' do
      it 'returns only cancelled orders' do
        cancelled_order = create(:order, cancelled: true)
        active_order = create(:order)

        result = Order.cancelled
        expect(result).to include(cancelled_order)
        expect(result).not_to include(active_order)
      end
    end

    describe '.active' do
      it 'returns only active orders' do
        cancelled_order = create(:order, cancelled: true)
        active_order = create(:order, cancelled: false)

        result = Order.active
        expect(result).not_to include(cancelled_order)
        expect(result).to include(active_order)
      end
    end
  end
end