class AddCodeToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :code, :string
  end
end
