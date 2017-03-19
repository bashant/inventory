class Purchase < ApplicationRecord
  has_many :purchase_item
  has_many :item
end
