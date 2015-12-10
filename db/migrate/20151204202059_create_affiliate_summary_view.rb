class CreateAffiliateSummaryView < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE VIEW affiliate_summaries AS
		SELECT users.affiliate_id,
		    users.tdate AS tdate,
		    transactions.product_name,
		    sum(transactions.amount)::numeric::money AS payment,
		    users.id AS user_id,
		    count(transactions.amount) AS n
		FROM transactions
		RIGHT JOIN (
			SELECT *
			FROM 
				(SELECT *
				FROM (select left(generate_series('2015-11-01', CURRENT_DATE, '1 month'::interval)::text,7) as tdate) as dates
				CROSS JOIN users) as user_dates) as users ON transactions.affiliate_id::text = users.affiliate_id::text AND "left"(transactions.date::text, 7) = users.tdate
		GROUP BY users.id, users.affiliate_id, users.tdate, transactions.product_name
		ORDER BY users.affiliate_id, users.tdate DESC, transactions.product_name;
    SQL
  end

  def self.down
    execute "DROP VIEW affiliate_summaries"
  end
end
