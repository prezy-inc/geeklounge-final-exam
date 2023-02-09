require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  include SessionsHelper
  describe "POST #create" do
    it "Turbo Streamを返す" do
      user = User.find(1)
      log_in user
      request.headers["ACCEPT"] = "text/vnd.turbo-stream.html"
      post :create, params: { id: 1 }, xhr: true
      expect(response.content_type).to include "text/vnd.turbo-stream.html"
    end
  end

  describe "DELETE #destroy" do
    it "Turbo Streamを返す" do
      FactoryBot.create(:like)
      user = User.find(1)
      log_in user
      request.headers["ACCEPT"] = "text/vnd.turbo-stream.html"
      post :destroy, params: { id: 1 }, xhr: true
      expect(response.content_type).to include "text/vnd.turbo-stream.html"
    end
  end
end
