class AddColumnCount < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :count, :integer, default: 0
  end
end
