# frozen_string_literal: true

class RenameValuteHistoryToValuteCourses < ActiveRecord::Migration[7.0]
  def change
    rename_table :valute_histories, :valute_courses
  end
end
