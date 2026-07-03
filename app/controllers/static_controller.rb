class StaticController < ApplicationController
  before_action :require_user
  def index
    # Only fetches events from today onwards
    @events = Event.where("date >= ?", Date.current).order(date: :asc)
  end
end