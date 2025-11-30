require 'csv'

puts 'Reading ./officers.csv...'
duplicate_records = []

data = CSV.read('./officers.csv')
data.drop(1).each do |row|
  business_name, officer_name, role_name = row
  business = Business.find_or_create_by!(name: business_name)
  officer = Officer.find_or_create_by!(name: officer_name)
  role = Role.find_or_create_by!(name: role_name)

  begin
    Association.create!(business: business, officer: officer, role: role)
  rescue
    puts "Found duplicate record: [#{business_name}, #{officer_name}, #{role_name}]"
    duplicate_records << row
  end
end

puts "Successfully seeded #{data.size - 1 - duplicate_records.size} rows"
unless duplicate_records.empty?
  puts "Found #{duplicate_records.size} duplicate rows"
end
