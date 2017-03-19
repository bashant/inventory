class Supplier < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_no, presence: true
  validates :email,presence: true
end
