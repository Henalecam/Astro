require 'rails_helper'

RSpec.describe "Admin::Variants", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/variants/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/variants/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admin/variants/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
