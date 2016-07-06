json.array!(@tech_sites) do |tech_site|
  json.extract! tech_site, :id, :name, :url, :subgroups, :subgroup_selector, :tech_selector, :comments
  json.url tech_site_url(tech_site, format: :json)
end
