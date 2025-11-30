class OfficersController < ApplicationController
  before_action :set_officer, only: [:show]

  def index
    @officers = Officer.all.sort_by(&:name)
  end

  def show
  end

  def search
    name_filter = params[:name]
    business_filter = params[:business]
    role_filter = params[:role]

    associations = Association.all.filter do |association|
      (name_filter.nil? or association.officer.name.match? name_filter.upcase) and
        (business_filter.nil? or association.business.name.match? business_filter.upcase) and
        (role_filter.nil? or association.role.name.match? role_filter.upcase)
    end

    res = {}
    associations.each do |association|
      unless res.include? association.officer.id
        res[association.officer.id] = {
          officer_id: association.officer.id,
          officer_name: association.officer.name,
          roles: []
        }
      end
      res[association.officer.id][:roles] << {
        role_id: association.role.id,
        role_name: association.role.name,
        business: {
          business_id: association.business.id,
          business_name: association.business.name
        }
      }
    end

    render json: res
  end

  private

  def set_officer
    @officer = Officer.find(params[:id])
  end
end
