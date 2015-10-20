class CatRentalRequestsController < ApplicationController

  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def new
    @cats = Cat.all
    render :new
  end

  def create
    @request = CatRentalRequest.new(rental_params)
    if @request.save
      redirect_to cat_url(@request.cat_id)
    else
      render json: @request.errors.full_messages, status: :unprocessable_entity
    end
  end

  

  private
  def rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end


end
