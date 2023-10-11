# frozen_string_literal: true

class CreateValuteHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :valute_histories do |t|
      t.belongs_to :valute, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end

    add_monetize :valute_histories, :value
  end
end
