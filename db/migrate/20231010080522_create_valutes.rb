# frozen_string_literal: true

class CreateValutes < ActiveRecord::Migration[7.0]
  def change
    create_table :valutes do |t|
      t.string :char_code
      t.string :name

      t.timestamps
    end
  end
end
