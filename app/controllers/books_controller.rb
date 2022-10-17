class BooksController < ApplicationController
  def index
    render json: Book.all, each_serializer: BookSerializer
  end

  def show
    render json: Book.find(params[:id]), serializer: BookSerializer
  end
end