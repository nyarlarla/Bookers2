class UsersController < ApplicationController

    def new
    	@user = User.new
    end

	def show
		@book = Book.new
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to book_path(current_user)
	end

	def create
		@user = User.new(book_params)
	end

private
    def user_params
    	params.require(:user).permit(:name,:introduction)
    end

end
