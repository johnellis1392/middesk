class Officer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :roles

  # has_many :roles

  # has_and_belongs_to_many :businesses
  # has_and_belongs_to_many :roles
  # has_many :associations
  #
  # def businesses
  #   associations.group_by(&:business).sort_by { _1[0].name }.map do |business, associations|
  #     [business, associations.map { _1.role.name }.sort]
  #   end
  # end
  #
  # def roles
  #   associations.group_by(&:role).sort_by { _1[0].name }.map do |role, associations|
  #     [role, associations.map { _1.business.name }.uniq.sort]
  #   end
  # end
end
