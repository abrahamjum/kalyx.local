class MembersController < ApplicationController

  def show
    @member = User.find(params[:id])
    @listings = Listing.all 
  end

end
