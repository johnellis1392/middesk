class Role < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  validates :name, presence: true

  belongs_to :business
  belongs_to :officer

  # has_and_belongs_to_many :officers
  # has_many :associations
  #
  # def officers
  #   associations.group_by(&:officer).sort_by { _1[0].name }.map do |officer, associations|
  #     [officer, associations.map { _1.business.name }.uniq.sort]
  #   end
  # end
end
