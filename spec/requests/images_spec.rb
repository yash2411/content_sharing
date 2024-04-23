require 'rails_helper'

RSpec.describe "Images", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/images/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/images/new"
      expect(response).to have_http_status(:success)
    end
  end

end
