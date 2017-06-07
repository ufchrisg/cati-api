require "rails_helper"

RSpec.describe WhiteCardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/white_cards").to route_to("white_cards#index")
    end

    it "routes to #show" do
      expect(get: "/white_cards/1").to route_to("white_cards#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/white_cards").to route_to("white_cards#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/white_cards/1").to route_to("white_cards#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/white_cards/1").to route_to("white_cards#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/white_cards/1").to route_to("white_cards#destroy", id: "1")
    end
  end
end
