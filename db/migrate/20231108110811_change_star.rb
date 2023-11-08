class ChangeStar < ActiveRecord::Migration[7.1]
  def up
    change_column :reviews, :star, 'integer USING CAST(star AS integer)'
  end

  def down
    change_column :reviews, :star, :string
  end
end
