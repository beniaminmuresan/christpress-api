# frozen_string_literal: true

class BibleReadingPlan < ApplicationRecord
  validates_presence_of :no_of_items, :read_unit, :time_unit, :notification_hour, :notification_minute, :start_date,
                        :notifications
end
