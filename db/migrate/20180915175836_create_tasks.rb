class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.text :title
      t.integer :status

      t.timestamps
    end
  end
end
