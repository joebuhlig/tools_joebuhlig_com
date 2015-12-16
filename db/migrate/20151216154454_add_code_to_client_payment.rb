class AddCodeToClientPayment < ActiveRecord::Migration
  def change
    add_column :client_payments, :code, :string
  end
end
