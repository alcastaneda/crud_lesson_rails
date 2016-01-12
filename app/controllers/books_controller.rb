class BooksController < ApplicationController
  # before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
        @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @checked_out = false
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    @checked_out = @book.checked_out
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to :show
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :index
  end

private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :checked_out)
  end
end
