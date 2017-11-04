class ChangeItems < ActiveRecord::Migration[5.1]
  def change
    change_column_default :items, :image, "pumpkin.png"
  end
end
