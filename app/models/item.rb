class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :buy_record

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :schedule_id
    validates :price
  end
  
  validates :price,
  numericality: { only_integer: true,
  greater_than: 299, less_than: 10000000}
  validates :price, format:{with:/\A[0-9]+\z/}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :schedule_id
  end
end
