json.extract! warehouse, :id, :name, :owner_name, :state_id, :district_id, :post_office, :police_station, :pincode, :postal_address, :status, :created_at, :updated_at
json.url warehouse_url(warehouse, format: :json)
