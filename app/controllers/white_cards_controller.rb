class WhiteCardsController < ApplicationController
  before_action :set_white_card, only: %i[show update destroy]

  # GET /white_cards
  def index
    @white_cards = WhiteCard.all

    render json: @white_cards
  end

  # GET /white_cards/1
  def show
    render json: @white_card
  end

  # POST /white_cards
  def create
    @white_card = WhiteCard.new(white_card_params)

    if @white_card.save
      render json: @white_card, status: :created, location: @white_card
    else
      render json: @white_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /white_cards/1
  def update
    if @white_card.update(white_card_params)
      render json: @white_card
    else
      render json: @white_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /white_cards/1
  def destroy
    @white_card.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_white_card
    @white_card = WhiteCard.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def white_card_params
    params.require(:white_card).permit(:text, :pack_id)
  end
end
