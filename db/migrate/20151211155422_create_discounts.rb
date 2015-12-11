class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.decimal :flat
      t.decimal :percentage
    end
  end
end
