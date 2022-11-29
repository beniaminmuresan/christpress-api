class VersesController < ApplicationController
  def index
    book = Book.friendly.find(params[:book_id])
    chapter = book.chapters.find(params[:chapter_id])
    render json: chapter.verses
  end

  def show
    book = Book.friendly.find(params[:book_id])
    chapter = book.chapters.find(params[:chapter_id])
    verse = chapter.verses.find(params[:id])
    render json: verse.includes(:reference_verses, chapters: :books)
  end
end