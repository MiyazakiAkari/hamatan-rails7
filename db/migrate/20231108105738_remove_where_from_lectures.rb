class RemoveWhereFromLectures < ActiveRecord::Migration[7.1]
  def change
    remove_column :lectures, :where
  end
end
