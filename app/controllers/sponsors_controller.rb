# app/controllers/sponsors_controller.rb
class SponsorsController < ApplicationController
  # Require login for all actions EXCEPT new, create, and show
  before_action :require_user, except: [:new, :create, :show]
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  def index
    @sponsors = Sponsor.order(created_at: :desc)
  end

  def show
  end

  def new
    @sponsor = Sponsor.new
  end

  def edit
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)

    if @sponsor.save
      redirect_to sponsor_path(@sponsor), notice: "Thank you for reaching out! Your sponsorship inquiry has been received."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sponsor.update(sponsor_params)
      redirect_to sponsor_path(@sponsor), notice: "Sponsor details were successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sponsor.destroy
    redirect_to sponsors_path, notice: "Sponsor was successfully deleted.", status: :see_other
  end

  private

  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end

  def sponsor_params
    params.require(:sponsor).permit(:company_name, :representative_name, :email, :message)
  end
end