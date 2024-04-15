require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) { create(:user) }
  let(:profile_params) {
    {
      profile: {
        full_name: "Yash",
        bio: "Hello, i am developer"
      }
    }
  }
  describe '#new' do
    it "renders new template" do
      get '/new_profile'
      expect(response).to render_template("new")
    end
  end

  describe '#create' do
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    context 'with valid params' do
      it "should create user profile" do
        expect {
          post '/profile', params: profile_params
        }.to change(Profile,  :count).by(1)
      end
    end
  end
end
