class ChangeStarToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :star, :integer, null: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
