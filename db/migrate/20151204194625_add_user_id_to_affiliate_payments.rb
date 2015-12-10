class AddUserIdToAffiliatePayments < ActiveRecord::Migration
  def change
    add_column :affiliate_payments, :user_id, :integer
  end
end
