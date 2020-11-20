class Station < ApplicationRecord
  with_options allow_blank: true do
    validates :line, length:{ maximum:30 }
    validates :station_name, length:{ maximum:30 }
    validates :minute, length:{ maximum:5 }
  end
    belongs_to :property
end
