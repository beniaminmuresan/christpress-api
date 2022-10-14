class BooksController < ApplicationController
  def index
    render json: Book.all, each_serializer: BookSerializer
  end
end