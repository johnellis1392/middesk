class Association < ApplicationRecord
  belongs_to :business, class_name: "Business"
  belongs_to :officer, class_name: "Officer"
  belongs_to :role, class_name: "Role"
end
