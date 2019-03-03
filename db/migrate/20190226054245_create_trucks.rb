class CreateTrucks < ActiveRecord::Migration[5.1]
  def change
    create_table :trucks do |t|
      t.string :name, null: false
      t.integer :start_time, null: false
      t.integer :end_time, null: false

      t.timestamps
    end
    add_index :trucks, :start_time
    add_index :trucks, :end_time
  end
end
