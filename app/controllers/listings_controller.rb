class ListingsController < ApplicationController

  def index
    @listings = Listing.order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @listing = Listing.new
    @member = current_user
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Update successful."
    else
      render 'edit'
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy
    redirect_to member_path(current_user)
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to @listing, notice: "Listing successfully created."
    else
      render 'new'
    end
  end

  private

    def listing_params
      params.require(:listing).permit(:title, :description, :price, :location,
      :zip_code, :crypto, :phone_number)
    end

end
