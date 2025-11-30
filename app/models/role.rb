class Role < ApplicationRecord
  validates :name, presence: true

  belongs_to :business
  belongs_to :officer
end
