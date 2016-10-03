class BooksController < ApplicationController
  def index
    @books = Book.all

    render :index
  end

  def new
    render :new
  end

  def create
    book = Book.create(book_params)

    redirect_to books_url
  end

  def destroy
    book = Book.find_by(id: params[:id])

    Book.delete(book)

    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
