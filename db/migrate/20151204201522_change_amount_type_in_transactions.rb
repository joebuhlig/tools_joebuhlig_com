class ChangeAmountTypeInTransactions < ActiveRecord::Migration
  def self.up
    change_column :transactions, :amount, :float
  end
 
  def self.down
    change_column :transactions, :amount, :integer
  end
end
