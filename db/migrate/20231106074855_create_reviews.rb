class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body
      t.string :star
      t.boolean :edited, null: false, default: false
      t.references :lecture, foreign_key: true,  null: false
      t.references :user, foreign_key: true,  null: false
      t.timestamps
    end
  end
end

