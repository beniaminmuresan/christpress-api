class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def show
    book = Book.friendly.find(params[:id])
    render json: book
  end
end