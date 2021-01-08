class BuyDestination
  include ActiveModel::Model
  attr_accessor :cord, :prefecture_id, :address1, :address2, :building, :tel, :user_id, :item_id, :buy_record_id, :token, :price

  with_options presence: true do
    validates :cord, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: {other_than: 1}
    validates :address1
    validates :address2
    validates :tel, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
    validates :price
  end



  def save
    buy_record = BuyRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(cord: cord, prefecture_id: prefecture_id, address1: address1, address2: address2, building: building, tel: tel, buy_record_id: buy_record.id  )
  end
end