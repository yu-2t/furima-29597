class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :fee_id, presence: true
  validates :prefectures_id, presence: true
  validates :schedule_id, presence: true
  validates :price, presence: true
  validates :price,
  numericality: { only_integer: true,
  greater_than: 300, less_than: 9999999}
  validates :price, format:{with:/\A[0-9]+\z/}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule

  validates :category_id,   numericality: {other_than: 1}
  validates :condition_id,  numericality: {other_than: 1}
  validates :fee_id,        numericality: {other_than: 1}
  validates :prefectures_id, numericality: {other_than: 1}
  validates :schedule_id, numericality: {other_than: 1}
  
 end
