require 'rails_helper'

RSpec.describe "BlackCards", type: :request do
  describe "GET /black_cards" do
    it "works! (now write some real specs)" do
      get black_cards_path
      expect(response).to have_http_status(200)
    end
  end
end
