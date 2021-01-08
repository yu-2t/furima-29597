class BuyRecord < ApplicationRecord
  has_one :destination
  belongs_to :item
end
