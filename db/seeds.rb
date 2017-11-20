# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Creating State ......"
s = State.create(name: {en: "West Bengal", bn: "পশ্চিমবঙ্গ"})

puts "Creating District, Blocks, Subdivision, Mouza ......"
1.upto(3) do |di|
  d = District.create(name: {en: "District-#{di}", bn: "জেলা-#{di}"}, state: s)
  1.upto(3)do |sdi|
    sd = Subdivision.create(name: {en: "Subdivision-#{sdi}(DST-#{d.id})",  bn: "মহকুমা-#{sdi}(DST-#{d.id})"}, district: d)
    1.upto(3) do |bi|
      b = Block.create(name: {en: "Block-#{bi}(SUB-#{sd.id})", bn: "ব্লক-#{bi}(SUB-#{sd.id}))"}, subdivision: sd)
      1.upto(3) do |mi|
        m = Mouza.create(name: {en: "Mouza-#{mi}(B-#{b.id})", bn: "মৌজা-#{mi}(B-#{b.id})"}, block: b)
      end
    end
  end
end
puts "Creating Roles...."
Role.create([
  {name: "ADA(Admin)(BLOCK)"},
  {name: "ADA(Admin)(SUB-DIVISION)"},
  {name: "DDA(Admin)(DISTRICT)"},
  {name: "DDA(MF)(STATE))"},
  {name: "Admin"}
])

puts "Creating Educations ........."
Education.create([
  {name: {en: "B.Tech", bn: "বি.টেক"}},
  {name: {en: "B.Sc", bn: "বি.এসসি"}},
  {name: {en: "B.COM", bn: "বি.কম"}},
])

puts "Creating ApplicantUser ......... "
s = State.first
dist = s.districts.first
subdiv = dist.subdivisions.first
block = subdiv.blocks.first
mouza = block.mouzas.first


applicant = ApplicantUser.create({
  email: "applicant@gmail.com",
  password: '12345678',
  applicant_profile_attributes:{
    name: "Test Applicant",
    mobile_no: "1234567890",
    gender: 'male',
    prefer_language: 'en',
    id_card_type: 'voter_card',
    id_card_number: "ID12345",
    dob: '09-07-1987',
  },
  communication_address_attributes:{
    street_no: Faker::Address.street_address,
    post_office: Faker::Address.city,
    police_station: Faker::Address.city,
    pin_code: Faker::Address.zip,
    state: s,
    district: dist,
    extended_type: 'rural',
    extended_data:{
      block_id: block.id,
      mouza_id: mouza.id,
      village: "Natun Gram",
      dag_no: "01/101",
      khatian_no: "01-203"
    }
  }
})

puts "Creating Warehouses ........"

20.times do 
  Warehouse.create({
    name: Faker::Company.name,
    owner_name: Faker::Name.name,
    state: s,
    district: dist,
    post_office: Faker::Address.street_name,
    police_station: Faker::Address.street_name,
    pincode: Faker::Address.zip,
    postal_address: Faker::Lorem.paragraph,
    applicant_user: applicant
  })
end

puts "Creating Qualification ............."

5.times do 
  Qualification.create({
    resource_type: 'others',
    resource_name: Faker::Name.name,
    education_id: Faker::Number.between(1,3),
    passing_institute: Faker::Educator.university,
    passing_year: Faker::Number.between(2001,2015),
    certificate_number: Faker::Code.asin,
    certificate_image: Faker::Avatar.image,
    status: 'active',
    applicant_user: applicant
  })
end

puts "Creating Admin User ......"

AdminUser.create({
  email: "admin@gmail.com",
  password: "12345678",
  admin_profile_attributes: {
    name: "Admin User 1", 
    mobile_no: "9477413039",
    prefer_language: "en"
  }, 
  designations_attributes: [ 
    {
      state_id: 1, 
      district_id: 1, 
      subdivision_id: 1, 
      block_id: 1, 
      role_id: 1
    }
  ]
})

Jurisdiction.create([
  {name: 'State'},
  {name: 'District'},
  {name: 'Subdivision'}
])

CertificationType.create([
  {name: 'Wholesalers Marketing Certificate'},
  {name: 'Retailers Marketing Certificate'},
])

FormMaster.create([
  {name: 'Form A1'},
  {name: 'Form A2'}
])
