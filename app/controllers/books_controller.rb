class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
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

  end

  private

  #ストパラ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end