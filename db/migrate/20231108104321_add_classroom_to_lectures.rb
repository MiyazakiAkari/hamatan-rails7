class AddClassroomToLectures < ActiveRecord::Migration[7.1]
  def change
    add_column :lectures, :classroom, :string, null: false
  end
end
