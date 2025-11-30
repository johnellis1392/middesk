class OfficersController < ApplicationController
  before_action :set_officer, only: [:show]

  def index
    @officers = Officer.all.sort_by(&:name)
  end

  def show
  end

  def search
    name_filter = params[:name] || nil
    business_filter = params[:business] || nil
    role_filter = params[:role] || nil

    res = []
    Officer.all.each do |officer|
      if name_filter.nil? or officer.name.match? name_filter.upcase
        roles = []
        officer.roles.each do |role|
          if role_filter.nil? or role.name.match? role_filter.upcase
            business = nil
            if business_filter.nil? or role.business.name.match? business_filter.upcase
              business = {
                business_id: role.business.id,
                business_name: role.business.name,
                # created_at: role.business.created_at,
                # updated_at: role.business.updated_at
              }
            end
            roles << {
              role_id: role.id,
              role_name: role.name,
              business: business,
              # created_at: role.created_at,
              # updated_at: role.updated_at
            }
          end
        end
        unless roles.empty?
          res << {
            officer_id: officer.id,
            officer_name: officer.name,
            roles: roles,
            # created_at: officer.created_at,
            # updated_at: officer.updated_at
          }
        end
      end
    end

    render json: res, status: :ok
  end

  private

  def set_officer
    @officer = Officer.find(params[:id])
  end
end
