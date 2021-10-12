class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
      @books = Book.all
      @book = Book.new
      @user = current_user

  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)
      else
        @books =Book.all
        #@book = Book.new
        @user = current_user
        render :index
      end
      #book = Book.new(book_params)
      #book.user_id = current_user.id#15
      #book.save
      #redirect_to book_path(book.id)
  end

  def show
      @book_show = Book.find(params[:id])
      @user_show = @book_show.user
      #@user = User.find(params[:id])
      @user_current = current_user#部分テンプレートでつかってる
     # @user = User.find(params[:id])
      @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to root_path unless current_user.id == @book.user_id
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
   else
      render :edit
   end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

end
