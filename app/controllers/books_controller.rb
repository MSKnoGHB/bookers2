class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def create 
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def destroy 
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end

  private

  #ストパラ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end