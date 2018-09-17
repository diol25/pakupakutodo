class ChangeColumnToList < ActiveRecord::Migration[5.0]
  def change
    change_column :lists, :cookie_id, :string, null: false
  end
end
