class StaticController < ApplicationController
  before_action :require_user, only: [:dashboard] 
  def index
    redirect_to dashboard_path if logged_in?
  end
  def boba_tea_menu
  end

  def gallery
  end

  def expo
    @events = Event.includes(:vendors)
                 .where("date >= ?", Date.yesterday)
                 .order(date: :asc)
  end

  def all_about_sip
  end
  def dashboard
    @events = Event.where("date >= ?", Date.current).order(date: :asc)
  end
end