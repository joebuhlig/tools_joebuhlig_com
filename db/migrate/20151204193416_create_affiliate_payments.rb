class CreateAffiliatePayments < ActiveRecord::Migration
  def change
    create_table :affiliate_payments do |t|
      t.string :affiliate_id
      t.string :date
      t.integer :amount

      t.timestamps null: false
    end
  end
end
