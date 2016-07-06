json.array!(@tech_listings) do |tech_listing|
  json.extract! tech_listing, :id, :name, :url, :source, :source_url, :description, :flagged, :submitted, :timestamps
  json.url tech_listing_url(tech_listing, format: :json)
end
