class ListingsController < ApplicationController

  def index
    @listings = Listing.all.order("created_at DESC")
  end

  def new
    @listing = Listing.new
  end

  def edit

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
    @listing.destroy
    redirect_to root_path
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
      params.require(:listing).permit(:title, :description)
    end

end
