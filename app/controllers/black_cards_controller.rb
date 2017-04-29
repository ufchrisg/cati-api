class BlackCardsController < ApplicationController
  before_action :set_black_card, only: %i[show update destroy]

  # GET /black_cards
  def index
    @black_cards = BlackCard.all

    render json: @black_cards
  end

  # GET /black_cards/1
  def show
    render json: @black_card
  end

  # POST /black_cards
  def create
    @black_card = BlackCard.new(black_card_params)
    if @black_card.save
      render json: @black_card, status: :created, location: @black_card
    else
      render json: @black_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /black_cards/1
  def update
    if @black_card.update(black_card_params)
      render json: @black_card
    else
      render json: @black_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /black_cards/1
  def destroy
    @black_card.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_black_card
    @black_card = BlackCard.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def black_card_params
    params.require(:black_card).permit(:text, :pack_id)
  end
end
