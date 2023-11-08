class AddYearToLectures < ActiveRecord::Migration[7.1]
  def change
    add_column :lectures, :year, :integer, null: false
  end
end
