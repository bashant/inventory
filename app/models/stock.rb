class Stock < ApplicationRecord
belongs_to :items
  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :est_sell_price, presence: true
end
