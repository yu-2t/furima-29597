class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_one :buy_record

  with_options presence: true do
    validates :images
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

  validate :validate_images

  private
  def validate_images
    return if images.count <= 4

    errors.add(:images,'画像は4枚まで登録できます')
  end
end
