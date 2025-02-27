FactoryBot.define do
  factory :order do
    item_name {"sample item"}
    cancelled { false }
  end  
end