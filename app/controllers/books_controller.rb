class BooksController < ApplicationController

  def index
      @books = Book.all
      @book = Book.new
      @user = current_user
  end

  def create
      book = Book.new(book_params)
      book.user_id = current_user.id#15
      book.save
      redirect_to books_path
  end

  def show
      @book_show = Book.find(params[:id])
      @user_show = @book_show.user
      @user = User.find(params[:id])
     # @user = User.find(params[:id])
      @book = Book.new
  end

  def edit
  end

  def destroy
  end

private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
