class PurchaseItem < ApplicationRecord
  belongs_to :purchase, required: false
  belongs_to :item
  accepts_nested_attributes_for :purchase, allow_destroy: true
end
