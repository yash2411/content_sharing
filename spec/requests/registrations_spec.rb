require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "#new" do
    it "renders new template" do
      get '/signup'
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    context "with valid params" do
      let(:valid_params) { { user: { email: "test@example.com", password: "password", password_confirmation: "password" } } }

      it "creates a new user" do
        expect {
          post '/signup', params: valid_params
        }.to change(User, :count).by(1)
      end
    end
  end
end
