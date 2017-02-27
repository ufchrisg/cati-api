require 'rails_helper'

RSpec.describe PacksController, type: :controller do

  let(:valid_attributes) {
    FactoryGirl.build(:pack).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    FactoryGirl.build(:no_name_pack).attributes.symbolize_keys
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all packs as @packs" do
      pack = FactoryGirl.create(:pack)
      get :index, params: {}, session: valid_session
      expect(assigns(:packs)).to eq([pack])
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    it "assigns the requested pack as @pack" do
      pack = FactoryGirl.create(:pack)
      get :show, params: {id: pack.to_param}, session: valid_session
      expect(assigns(:pack)).to eq(pack)
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      after(:each) { expect(response.status).to eq(201) }

      it "creates a new Pack" do
        expect {
          post :create, params: {pack: valid_attributes}, session: valid_session
        }.to change(Pack, :count).by(1)
      end

      it "assigns a newly created pack as @pack" do
        post :create, params: {pack: valid_attributes}, session: valid_session
        expect(assigns(:pack)).to be_a(Pack)
        expect(assigns(:pack)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved pack as @pack" do
        post :create, params: {pack: invalid_attributes}, session: valid_session
        expect(assigns(:pack)).to be_a_new(Pack)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.build(:updated_pack).attributes.symbolize_keys
      }

      after(:each) { expect(response.status).to eq(200) }

      it "updates the requested pack" do
        pack = FactoryGirl.create(:pack)
        put :update, params: {id: pack.to_param, pack: new_attributes}, session: valid_session
        pack.reload
        expect(pack.name).to eq("Pack 1")
      end

      it "assigns the requested pack as @pack" do
        pack = FactoryGirl.create(:pack)
        put :update, params: {id: pack.to_param, pack: valid_attributes}, session: valid_session
        expect(assigns(:pack)).to eq(pack)
      end
    end

    context "with invalid params" do
      it "assigns the pack as @pack" do
        pack = FactoryGirl.create(:pack)
        put :update, params: {id: pack.to_param, pack: invalid_attributes}, session: valid_session
        expect(assigns(:pack)).to eq(pack)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pack" do
      pack = Pack.create! valid_attributes
      expect {
        delete :destroy, params: {id: pack.to_param}, session: valid_session
      }.to change(Pack, :count).by(-1)
      expect(response.status).to eq(204)
    end
  end

end
