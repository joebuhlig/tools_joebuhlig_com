class FixErrorColName < ActiveRecord::Migration
  def change
  	rename_column :tech_sites, :errors, :found_errors
  end
end
