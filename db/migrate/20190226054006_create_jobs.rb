class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :truck_id, null: false
      t.string :customer_name, null: false
      t.date :date, null: false
      t.integer :start_time, null: false
      t.integer :est_end_time, null: false
      t.integer :duration, null: false

      t.timestamps
    end
    add_index :jobs, :truck_id
    add_index :jobs, :date
    add_index :jobs, :start_time
    add_index :jobs, :est_end_time
  end
end
