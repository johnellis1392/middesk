class RolesController < ApplicationController
  before_action :set_role, only: [:show]

  def index
    @roles = Role.all.sort_by(&:name)
  end

  def show
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end
end
