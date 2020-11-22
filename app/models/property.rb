class Property < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 100 }
    validates :price, numericality: true
    validates :address, length: { maximum: 100 }
    validates :age, numericality: true
  end
  validates :note, length: { maximum: 255 }, allow_blank: true
  has_many :stations
  # has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true
end
