require "rails_helper"

RSpec.describe BlackCardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/black_cards").to route_to("black_cards#index")
    end

    it "routes to #new" do
      expect(:get => "/black_cards/new").to route_to("black_cards#new")
    end

    it "routes to #show" do
      expect(:get => "/black_cards/1").to route_to("black_cards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/black_cards/1/edit").to route_to("black_cards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/black_cards").to route_to("black_cards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/black_cards/1").to route_to("black_cards#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/black_cards/1").to route_to("black_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/black_cards/1").to route_to("black_cards#destroy", :id => "1")
    end

  end
end
