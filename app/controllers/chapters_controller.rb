class ChaptersController < ApplicationController
  def index
    book = Book.find(params[:book_id])
    render json: book.chapters
  end

  def show
    book = Book.find(params[:book_id])
    chapter = Chapter.find(params[:id])
    render json: chapter
  end
end