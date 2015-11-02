class RemovePaypalFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :paypal
  end
end
