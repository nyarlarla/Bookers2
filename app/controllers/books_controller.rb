class BooksController < ApplicationController
before_action :authenticate_user!
   def new
   	  @book = Book.new
   end

   def index
      @book = Book.new
      @user = current_user
      @books = Book.all
   end

   def create
       @book = Book.new(book_params)
       @book.user_id = current_user.id
       if @book.save
          flash[:notice] = "You have creatad book successfully."
          redirect_to book_path(@book)
       else
          redirect_to books_path(@book)
          flash[:alert] = "Post error occurred"
       end
   end


   def show
      @new_book = Book.new
      @book = Book.find(params[:id])
      @user = current_user
   end

   def edit
      @book = Book.find(params[:id])
      if @book.user_id != current_user.id
        redirect_to books_path
        flash[:alert] = "Erro! The page you were looking for doesn't exist."
      end
   end

   def update
       @book = Book.find(params[:id])
       if @book.update(book_params)
          flash[:notice] = "You have updated book successfully."
          redirect_to book_path(@book)
       else
          flash[:alert] = "Post edit error."
          render :edit
       end
   end

   def destroy
       @book = Book.find(params[:id])
       if @book.destroy
          flash[:notice] = "Post deleted"
          redirect_to books_path
       end
   end

private
   def book_params
       params.require(:book).permit(:title, :body, :user_id)
   end



end
