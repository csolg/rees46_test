class AddIndexToValuteCourses < ActiveRecord::Migration[7.0]
  def change
    add_index :valute_courses, [:valute_id, :date]
    remove_index :valute_courses, [:valute_id]
  end
end
