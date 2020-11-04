require 'rails_helper'

RSpec.describe "Cats", type: :request do

  describe "GET /edit" do
    it "returns http success" do
      get "/cats/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
