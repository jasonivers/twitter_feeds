require 'rails_helper'

RSpec.describe TwitterController, type: :controller do
  include Devise::TestHelpers
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = create(:user)
    sign_in user
  end

  describe 'POST #post' do
    context 'With valid handle' do
      it 'assigns @tweets with valid handle' do
        post :post, handle: 'justinbieber'
        expect(assigns(:tweets)).to be_kind_of(Array)
      end
    end
    context 'With empty handle' do
      it 'redirects to / with empty handle' do
        post :post, handle: ''
        expect(response).to redirect_to '/'
      end
    end
    context 'With handle that has no tweets' do
      it 'redirects to / with handle that has no tweets (or doesn\'t exist)' do
        post :post, handle: 'ad0760932y5623halkh630927'
        expect(response).to redirect_to '/'
      end
    end
  end
end
