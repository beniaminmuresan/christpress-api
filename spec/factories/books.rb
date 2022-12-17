# frozen_string_literal: true

FactoryBot.define do
  factory :book, class: 'Book' do
    name { %w[Genesis Exodus].sample }
    number { %w[1 2].sample }
  end
end
