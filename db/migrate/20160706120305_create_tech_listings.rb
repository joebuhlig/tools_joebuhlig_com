class CreateTechListings < ActiveRecord::Migration
  def change
    create_table :tech_listings do |t|
      t.string :name
      t.string :url
      t.string :source
      t.string :source_url
      t.text :description
      t.boolean :flagged
      t.boolean :submitted

      t.timestamps null: false
    end
  end
end
