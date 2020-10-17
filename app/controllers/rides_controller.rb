class RidesController < ApplicationController
    before_action :logged_in?
    def new
       
    end

    def create
        @ride = Ride.create(user_id: current_user.id, attraction_id:  params[:attraction_id])
        flash[:notice] = @ride.take_ride
         redirect_to user_path(@ride.user)
       
    end

   
end
