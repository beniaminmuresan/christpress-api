# frozen_string_literal: true

class BibleReadingPlansController < ApplicationController
  def index
    render json: BibleReadingPlan.all
  end

  def show
    bible_reading_plan = BibleReadingPlan.find(params[:id])
    render json: bible_reading_plan
  end

  def create
    bible_reading_plan = BibleReadingPlan.create(bible_reading_plan_params)
    render json: bible_reading_plan
  end

  private

    def bible_reading_plan_params
      params.permit(:no_of_items, :read_unit, :time_unit, :notification_hour, :notification_minute, :start_date,
                    notifications: [])
    end
end
