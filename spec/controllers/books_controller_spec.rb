# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe 'GET #show' do
    let!(:book) { FactoryBot.create(:book, name: 'Genesis', number: 1) }
    let(:params) { { id: book.id } }
    subject { get :show, params: }

    it 'returns book with id provided as param' do
      subject

      expect(response.body).to eq(BookSerializer.new(book).serializable_hash.to_json)
    end
  end

  describe 'GET #index' do
    let!(:book_1) { FactoryBot.create(:book, name: 'Genesis', number: 1) }
    let!(:book_2) { FactoryBot.create(:book, name: 'Exodus', number: 2) }

    let(:params) { {} }
    subject { get :index, params: }

    it 'returns all books' do
      subject

      expect(response.body).to eq([
        BookSerializer.new(book_1).serializable_hash,
        BookSerializer.new(book_2).serializable_hash
      ].to_json)
    end
  end
end
