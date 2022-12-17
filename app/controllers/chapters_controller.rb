# frozen_string_literal: true

class ChaptersController < ApplicationController
  def index
    book = Book.friendly.find(params[:book_id])
    render json: book.chapters
  end

  def show
    book = Book.friendly.find(params[:book_id])
    chapter = book.chapters.find(params[:id])
    render json: chapter
  end
end
