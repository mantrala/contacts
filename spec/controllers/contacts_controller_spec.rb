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
    let(:file) { fixture_file_upload 'files/data.csv', 'text/csv' }
    before { post :upload, file: file }

    it 'responds with 302' do
      expect(response).to have_http_status(302)
    end

    it 'imports the contacts in the file' do
      expect(Contact.count).to eq(200)
    end

  end

  describe 'a POST to #upload ' do
    let(:file) { fixture_file_upload 'files/Rakefile', 'text/xml' }

    it 'rejects import from if not from a csv' do
      post :upload, file: file
      expect(flash[:error]).to be_present
      expect(flash[:error]).to eq('Only csv files are allowed')
    end
  end

end
