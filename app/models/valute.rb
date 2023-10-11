# frozen_string_literal: true

class Valute < ApplicationRecord
  has_many :valute_courses, dependent: :destroy
end
