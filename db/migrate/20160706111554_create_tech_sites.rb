class CreateTechSites < ActiveRecord::Migration
  def change
    create_table :tech_sites do |t|
      t.boolean :active
      t.string :name
      t.string :url
      t.boolean :subgroups
      t.string :subgroup_selector
      t.string :tech_selector
      t.boolean :errors
      t.text :comments

      t.timestamps
    end
  end
end
