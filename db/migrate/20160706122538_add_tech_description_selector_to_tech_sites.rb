class AddTechDescriptionSelectorToTechSites < ActiveRecord::Migration
  def change
    add_column :tech_sites, :tech_description_selector, :string
  end
end
