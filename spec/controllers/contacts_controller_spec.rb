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

  describe 'a POST to #upload with a CSV file' do
    let(:file) { fixture_file_upload 'files/data.csv' }
    before { post :upload, file: file }

    it 'responds with 200' do
      expect(response).to have_http_status(302)
    end

    it 'imports the contacts in the file' do
      expect(Contact.count).to eq(200)
    end
  end

end
