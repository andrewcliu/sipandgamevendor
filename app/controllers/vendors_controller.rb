class VendorsController < ApplicationController
  before_action :require_user

  def new
    @vendor = Vendor.new(event_id: params[:event_id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.name = @vendor.name&.downcase
    @vendor.ig_handle = @vendor.ig_handle&.downcase

    if @vendor.save
      redirect_to event_path(@vendor.event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @event = @vendor.event
    
    @vendor.destroy
    
    redirect_to event_path(@event), notice: "Vendor was successfully deleted.", status: :see_other
  end

  # PATCH/PUT /vendors/:id
  def update
    @vendor = Vendor.find(params[:id])
    
    if @vendor.update(vendor_params)
      redirect_to event_path(@vendor.event_id), notice: "Vendor details were successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :ig_handle, :deposit_paid, :received_payment, :total_tables, :notes, :price, :event_id)
  end
end