class Association < ApplicationRecord
  belongs_to :business, class_name: "Business", foreign_key: "business_id"
  belongs_to :officer, class_name: "Officer", foreign_key: "officer_id"
  belongs_to :role, class_name: "Role", foreign_key: "role_id"
end
