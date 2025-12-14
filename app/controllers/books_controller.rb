class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def create 
    book = Book.new(book_params)
    if book.save
      redirect_to books_path
    else
      render :index
    end
  end



  private

  #ストパラ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end