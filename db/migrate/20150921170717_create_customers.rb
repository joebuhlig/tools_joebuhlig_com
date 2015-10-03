class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :user_id
      t.string :customer_id

      t.timestamps null: false
    end
  end
end
