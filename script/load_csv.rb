require 'csv'
require_relative "../config/environment"

puts 'Reading ./officers.csv...'
data = CSV.read('./officers.csv')
data.drop(1).each do |row|
  business_name, officer_name, role_name = row
  business = Business.find_or_create_by!(name: business_name)
  officer = Officer.find_or_create_by!(name: officer_name)
  role = Role.find_or_create_by!(name: role_name)
  association = Association.create!(business: business, officer: officer, role: role)

  # business.officers.find_or_create_by(name: officer_name)
  # officer.roles.find_or_create_by(name: role_name)

  # business.save!
  # officer.save!
  # role.save!
  # association.save!
end

puts "Successfully seeded #{data.size - 1} rows"
