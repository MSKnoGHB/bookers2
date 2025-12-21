class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @new_book = Book.new
  end

  def show 
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit



  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user
    if @book.save
      redirect_to book_path(@book)
    else
      @books = Book.all 
      render :index
    end
  end




  private

  #ストパラ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
