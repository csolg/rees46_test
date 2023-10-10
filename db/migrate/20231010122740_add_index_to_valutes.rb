class AddIndexToValutes < ActiveRecord::Migration[7.0]
  def change
    add_index :valutes, :char_code, unique: true
  end
end
