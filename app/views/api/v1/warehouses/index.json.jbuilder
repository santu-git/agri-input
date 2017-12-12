json.success true
json.message "100 Records"
json.data do 
  json.array! @appointments do |appointment|
  json.schedule_time appointment.schedule_time || ''
  json.application_number appointment.application_number
  json.warehouse appointment.appointable, :id, :name, :owner_name, :post_office, :police_station, :pincode, :postal_address
end
end
    

