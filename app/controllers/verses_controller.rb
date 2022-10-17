class VersesController < ApplicationController
  def index
    book = Book.find(params[:book_id])
    chapter = book.chapters.find(params[:chapter_id])
    render json: chapter.verses, each_serializer: VerseSerializer
  end

  def show
    book = Book.find(params[:book_id])
    chapter = book.chapters.find(params[:chapter_id])
    verse = chapter.verses.find(params[:id])
    render json: verse, serializer: VerseSerializer
  end
end