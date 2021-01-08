FactoryBot.define do
  factory :buy_destination do
    cord          {"123-1234"}
    prefecture_id {2}
    address1      {"大宮"}
    address2      {1-1-1}
    building      {"アパー"}
    tel           {"09012341234"}
    token         {"tok_0000000000000000"}
    price         {9000}
  
   
  end
end
