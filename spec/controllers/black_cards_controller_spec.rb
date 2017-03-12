require 'rails_helper'

RSpec.describe BlackCardsController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.build(:black_card).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:invalid_black_card).attributes.symbolize_keys
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all black_cards as @black_cards" do
      black_card = BlackCard.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:black_cards)).to eq([black_card])
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "assigns the requested black_card as @black_card" do
      black_card = BlackCard.create! valid_attributes
      get :show, params: {id: black_card.to_param}, session: valid_session
      expect(assigns(:black_card)).to eq(black_card)
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      after(:each) { expect(response.status).to eq(201) }

      it "creates a new BlackCard" do
        expect {
          post :create, params: {black_card: valid_attributes}, session: valid_session
        }.to change(BlackCard, :count).by(1)
      end

      it "assigns a newly created black_card as @black_card" do
        post :create, params: {black_card: valid_attributes}, session: valid_session
        expect(assigns(:black_card)).to be_a(BlackCard)
        expect(assigns(:black_card)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved black_card as @black_card" do
        post :create, params: {black_card: invalid_attributes}, session: valid_session
        expect(assigns(:black_card)).to be_a_new(BlackCard)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:updated_black_card).attributes.symbolize_keys
      }

      after(:each) { expect(response.status).to eq(200) }

      it "updates the requested black_card" do
        black_card = BlackCard.create! valid_attributes
        put :update, params: {id: black_card.to_param, black_card: new_attributes}, session: valid_session
        black_card.reload
        expect(black_card.text).to eq("Riddle me that: {_}")
      end

      it "assigns the requested black_card as @black_card" do
        black_card = BlackCard.create! valid_attributes
        put :update, params: {id: black_card.to_param, black_card: valid_attributes}, session: valid_session
        expect(assigns(:black_card)).to eq(black_card)
      end
    end

    context "with invalid params" do
      it "assigns the black_card as @black_card" do
        black_card = BlackCard.create! valid_attributes
        put :update, params: {id: black_card.to_param, black_card: invalid_attributes}, session: valid_session
        expect(assigns(:black_card)).to eq(black_card)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested black_card" do
      black_card = BlackCard.create! valid_attributes
      expect {
        delete :destroy, params: {id: black_card.to_param}, session: valid_session
      }.to change(BlackCard, :count).by(-1)
      expect(response.status).to eq(204)
    end
  end

end
