class UsersController < ApplicationController
before_action :authenticate_user!
    def new
    	@user = User.new
    end

    def index
      	@book = Book.new
     	@user = current_user
     	@books = Book.all
     	@users =  User.all
    end

	def show
		@book = Book.new
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
		   redirect_to user_path(current_user)
		   flash[:alert] = "Erro! The page you were looking for doesn't exist."
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   redirect_to user_path(@user)
		   flash[:notice] = "You have updated user successfully."
		else
		   flash[:alert] = "Account creation error"
		   render :edit
		end
	end

	def create
		@user = User.new(book_params)
	end

private
    def user_params
    	params.require(:user).permit(:name,:introduction,:profile_image)
    end

end
