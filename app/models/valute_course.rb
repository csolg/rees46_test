# frozen_string_literal: true

class ValuteCourse < ApplicationRecord
  belongs_to :valute

  monetize :value_cents
end
