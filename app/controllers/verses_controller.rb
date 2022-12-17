# frozen_string_literal: true

class VersesController < ApplicationController
  def index
    book = Book.friendly.find(params[:book_id])
    chapter = book.chapters.find(params[:chapter_id])
    render json: chapter.verses.includes(:reference_verses)
  end

  def show
    book = Book.friendly.find(params[:book_id])
    chapter = book.chapters.find(params[:chapter_id])
    verse = chapter.verses.find(params[:id])
    render json: verse
  end
end
