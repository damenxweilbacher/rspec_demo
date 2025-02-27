require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'can create an subscription with the default factory' do 
    subscription = create(:subscription)
    expect(subscription).to be_valid
    puts "------------"
    puts subscription.name 
    puts "------------"
    puts subscription.cancelled
    puts "------------"
  end 

  it 'cannot create an subscription if item_name is nil' do 
    subscription = Subscription.new(name: nil, cancelled: true)
    expect(subscription).to be_invalid
    puts "----------"
    puts subscription.name
    puts "----------" 
    puts "status: #{subscription.cancelled}"
    puts "----------"
  end 

  describe 'scopes' do
    describe '.cancelled' do
      it 'returns only cancelled subscriptions' do
        cancelled_subscription = create(:subscription, cancelled: true)
        active_subscription = create(:subscription)

        result = Subscription.cancelled
        expect(result).to include(cancelled_subscription)
        expect(result).not_to include(active_subscription)
      end
    end

    describe '.active' do
      it 'returns only active subscriptions' do
        cancelled_subscription = create(:subscription, cancelled: true)
        active_subscription = create(:subscription, cancelled: false)

        result = Subscription.active
        expect(result).not_to include(cancelled_subscription)
        expect(result).to include(active_subscription)
      end
    end
  end
end
