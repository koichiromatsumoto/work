class BooksController < ApplicationController

    before_action :authenticate_user!


	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@books = Book.all
		if  @book.save
		    redirect_to book_path(@book.id)
		    flash[:notice] = "Book was successfully created."
		else
			render :index
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		   redirect_to book_path(@book.id)
		   flash[:notice] = "Book was successfully updated."
		else
		   render :edit
		end
	end

	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.new
		@current_book = Book.find(params[:id])
        @user = @current_book.user_id
	end

	def destroy
		@current_book = Book.find(params[:id])
		@current_book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:book_title, :book_body)
	end

end
