class Item < ApplicationRecord
  belongs_to :purchases
  has_one :stocks
  accepts_nested_attributes_for :stocks
  validates :item_group_id, presence: true
  validates :name, presence: true, length: {minimum: 1}
  validates :unit_id, presence: true, numericality: {only_integer: 2}
  validates :item_code, presence: true, length: {minimum: 2}
  validates :quantity, presence: true, numericality: {only_integer: 2}
  validates :description, presence: true, length: {minimum: 2}
  validates :item_group_id, presence: true, numericality: {only_integer: 2}
  validates :expiry_date, presence: true, length: {minimum: 1}
end
