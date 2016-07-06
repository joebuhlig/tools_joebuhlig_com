class AddFirstScrapeToTechSites < ActiveRecord::Migration
  def change
    add_column :tech_sites, :first_scrape, :boolean
  end
end
