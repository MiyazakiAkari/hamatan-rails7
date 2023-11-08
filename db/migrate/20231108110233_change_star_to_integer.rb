class ChangeStarToInteger < ActiveRecord::Migration[7.1]
  def up
    # 文字列を整数に変換するためのUSING句を追加
    change_column :reviews, :star, 'integer USING CAST(star AS integer)'
  end

  def down
    # ロールバックの場合は、整数を文字列に戻す
    change_column :reviews, :star, :string
  end
end
