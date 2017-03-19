class CompanyProfile < ApplicationRecord
  validates :name, presence: true, length: {minimum: 1}
  validates :address, presence: true, length: {minimum: 1}
  validates :vdc_mun, presence: true, length: {minimum: 2}
  validates :ward_no, presence: true, numericality: {only_integer: 2}
  validates :phone_no, presence: true, numericality: {only_integer: 2}
  validates :vat_pan_no, presence: true, length: {minimum: 1}

  validates :district, presence: true, length: {minimum: 1}
  validates :zone, presence: true, length: {minimum: 1}

  mount_uploader :logo_url,LogoUploader
end
