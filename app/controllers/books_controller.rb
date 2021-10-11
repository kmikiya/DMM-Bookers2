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
      @user_current = current_user#部分テンプレートでつかってる
     # @user = User.find(params[:id])
      @book = Book.new
      @user_edit = current_user#16行目のif文で使ってる
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
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
