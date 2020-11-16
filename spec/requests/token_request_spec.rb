require 'rails_helper'

RSpec.describe "Tokens", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/token/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/token/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
