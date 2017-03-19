class ItemGroup < ApplicationRecord
  has_many :items
  validates :name, presence: true
  #validates :parent_id, presence: true
  validates :description, presence: true
end
