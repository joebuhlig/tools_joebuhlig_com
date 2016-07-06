class AddTechLinkSelectorToTechSites < ActiveRecord::Migration
  def change
    add_column :tech_sites, :tech_link_selector, :string
  end
end
