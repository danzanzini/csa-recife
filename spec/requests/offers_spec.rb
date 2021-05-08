require 'rails_helper'

RSpec.describe "Offers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/offers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/offers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/offers/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/offers/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
