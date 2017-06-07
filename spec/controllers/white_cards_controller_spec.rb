require "rails_helper"

RSpec.describe WhiteCardsController, type: :controller do
  let(:valid_attributes) { attributes_with_foreign_keys(:white_card) }

  let(:invalid_attributes) {
    attributes_with_foreign_keys(:invalid_white_card)
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all white_cards as @white_cards" do
      white_card = WhiteCard.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:white_cards)).to eq([white_card])
    end
  end

  describe "GET #show" do
    it "assigns the requested white_card as @white_card" do
      white_card = WhiteCard.create! valid_attributes
      get :show,
        params: { id: white_card.to_param },
        session: valid_session
      expect(assigns(:white_card)).to eq(white_card)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new WhiteCard" do
        expect {
          post :create,
            params: { white_card: valid_attributes },
            session: valid_session
        }.to change(WhiteCard, :count).by(1)
      end

      it "assigns a newly created white_card as @white_card" do
        post :create,
          params: { white_card: valid_attributes },
          session: valid_session
        expect(assigns(:white_card)).to be_a(WhiteCard)
        expect(assigns(:white_card)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved white_card as @white_card" do
        post :create,
          params: { white_card: invalid_attributes },
          session: valid_session
        expect(assigns(:white_card)).to be_a_new(WhiteCard)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:updated_white_card) }

      it "updates the requested white_card" do
        white_card = WhiteCard.create! valid_attributes
        put :update,
          params: { id: white_card.to_param, white_card: new_attributes },
          session: valid_session
        white_card.reload
        expect(white_card.text).to eq("But not Robin.")
      end

      it "assigns the requested white_card as @white_card" do
        white_card = WhiteCard.create! valid_attributes
        put :update,
          params: { id: white_card.to_param, white_card: valid_attributes },
          session: valid_session
        expect(assigns(:white_card)).to eq(white_card)
      end
    end

    context "with invalid params" do
      it "assigns the white_card as @white_card" do
        white_card = WhiteCard.create! valid_attributes
        put :update,
          params: { id: white_card.to_param, white_card: invalid_attributes },
          session: valid_session
        expect(assigns(:white_card)).to eq(white_card)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested white_card" do
      white_card = WhiteCard.create! valid_attributes
      expect {
        delete :destroy,
          params: { id: white_card.to_param }, session: valid_session
      }.to change(WhiteCard, :count).by(-1)
    end
  end
end
