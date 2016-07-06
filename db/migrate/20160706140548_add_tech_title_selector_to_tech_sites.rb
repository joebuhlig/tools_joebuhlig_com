class AddTechTitleSelectorToTechSites < ActiveRecord::Migration
  def change
    add_column :tech_sites, :tech_title_selector, :string
  end
end
