class CreateClientPayments < ActiveRecord::Migration
  def change
    create_table :client_payments do |t|
      t.text :description
      t.integer :amount

      t.timestamps null: false
    end
  end
end
