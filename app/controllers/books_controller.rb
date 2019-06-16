class BooksController < ApplicationController

   def new
   	 @book = Book.new
   end

   def create
       @book = Book.new(book_params)
       @book.user_id = current_user.id
       if @book.save
          redirect_to book_path(current_user)
       else
         render :new
       end
   end


   def show
       @book = Book.find(params[:id])
   end

   def destroy
   end

private
   def book_params
       params.require(:book).permit(:title, :body, :user_id)
   end



end
