class Officer < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :roles
end
