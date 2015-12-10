class AddBraintreeIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :braintree_id, :string
  end
end
