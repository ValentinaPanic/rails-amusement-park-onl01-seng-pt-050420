class UsersController < ApplicationController

    def index

    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        # byebug
        if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
        else 
            render :new
        
        end
    end

    def edit
        @user = User.find(params[:id])
      end
    
    def update
        @user = User.find(params[:id])
        if @user.save
          @user.update(user_params)
          redirect_to user_path
        else
          redirect_to edit_user_path
        end
    end
    def show
        if !logged_in?
            redirect_to root_path
        else
        @user = User.find(params[:id])
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :happiness, :nausea, :tickets, :height, :admin, :password)
    end
end
