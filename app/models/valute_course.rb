class ValuteCourse < ApplicationRecord
  belongs_to :valute

  monetize :value_cents
end
