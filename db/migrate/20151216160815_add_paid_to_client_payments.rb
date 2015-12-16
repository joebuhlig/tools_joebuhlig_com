class AddPaidToClientPayments < ActiveRecord::Migration
  def change
    add_column :client_payments, :paid, :boolean
  end
end
