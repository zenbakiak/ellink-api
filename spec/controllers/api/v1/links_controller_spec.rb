# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do
  context 'with valid information' do
    let(:link_params) { FactoryBot.attributes_for(:link) }

    describe 'POST #create' do
      it 'returns http success after creating new link' do
        post :create, params: { link: link_params }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #prefetch' do
      it 'returns http success after receiving a valid link' do
        post :prefetch, params: { link: link_params }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET link by slug' do
      it 'returns data after receiving a valid link slug' do
        link = FactoryBot.create(:link)
        get :show, params: { id: link.to_param }
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'with invalid params' do
    let(:invalid_link_params) { { url: 'https://thispagedoesnotexist.com' } }

    it 'renders a JSON response with errors if new link data is invalid' do
      post :create, params: { link: invalid_link_params }
      expect(response.status).to eq(500)
    end

    describe 'GET link with invalid slug' do
      it 'render not found after receiving an invalid slug' do
        get :show, params: { id: 'aaaAA' }
        expect(response.status).to eq(500)
      end
    end
  end
end
