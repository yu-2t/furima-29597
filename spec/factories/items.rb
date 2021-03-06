FactoryBot.define do
  factory :item do
    name            {"商品名"}
    price           {500}
    text            {"サンプル"}
    category_id     {2}
    condition_id    {2}
    fee_id          {2}
    prefecture_id  {2}
    schedule_id     {2}
    association :user
  end
end
