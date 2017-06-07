require 'rails_helper'

RSpec.describe "WhiteCards", type: :request do
  describe "GET /white_cards" do
    it "works! (now write some real specs)" do
      get white_cards_path
      expect(response).to have_http_status(200)
    end
  end
end
