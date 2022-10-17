class ChaptersController < ApplicationController
  def index
    book = Book.find(params[:book_id])
    render json: book.chapters, each_serializer: ChapterSerializer
  end

  def show
    book = Book.find(params[:book_id])
    render json: book.chapters.find(params[:id]), serializer: ChapterSerializer
  end
end