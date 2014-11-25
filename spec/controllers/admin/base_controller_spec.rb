require "rails_helper"

class Admin::AnonymousController < Admin::BaseController; end;

RSpec.describe Admin::AnonymousController, :type => :controller do
  controller do
    def index
      render text: 'lol'
    end
  end

  describe 'when not logged in' do

    it 'redirects to login page' do
      get :index
      expect(response).to redirect_to('/admin')
    end
  end

  describe 'when logged in' do
    describe 'when user is not an admin' do
      before(:each) { login_user }

      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to('/admin')
      end
    end

    describe 'when user is an admin' do
      before(:each) { login_admin }

      it 'does not redirect to login page' do
        get :index
        expect(response).to_not redirect_to('/admin')
      end
    end

  end
end