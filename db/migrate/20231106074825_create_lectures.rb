class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :semester, null: false
      t.string :day, null: false
      t.string :time, null: false
      t.string :course, null: false
      t.string :title, null: false
      t.string :faculty, null: false
      t.string :teacher, null: false
      t.boolean :edited, null: false, default: false
      t.references :user, foreign_key: true,  null: false
      
      t.timestamps
    end
  end
end
