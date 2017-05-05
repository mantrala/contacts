require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe '#index' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns an instance variable of all contacts' do
      get :index, params: {}
      expect(assigns(:contacts)).not_to eq(nil)
    end
  end
end
