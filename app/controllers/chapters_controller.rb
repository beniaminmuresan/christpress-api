class ChaptersController < ApplicationController
  def index
    render json: Chapter.where(book_id: params[:book_id]), each_serializer: ChapterSerializer
  end

  def show
    render json: Chapter.where(book_id: params[:book_id]).find(params[:id]), serializer: ChapterSerializer
  end
end