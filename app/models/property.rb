class Property < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 100 }
    validates :price, numericality: true
    validates :address, length: { maximum: 100 }
    validates :age, numericality: true
  end
  validates :note, length: { maximum: 255 }, allow_blank: true
  has_many :stations
  accepts_nested_attributes_for :stations, reject_if: :reject_both_blank, allow_destroy: true
  def reject_both_blank(attributes)
    exists = attributes[:id].present?
    empty = attributes[:line].blank? and attributes[:station_name].blank? and attributes[:minute].blank?
      attributes.merge!(_destroy:'1') if exists && empty
      # !exists && empty#falseを返す？
  end
end
