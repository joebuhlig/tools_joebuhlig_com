class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :date
      t.string :status
    end
  end
end
