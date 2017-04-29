class PacksController < ApplicationController
  before_action :set_pack, only: %i[show update destroy]

  # GET /packs
  def index
    @packs = Pack.all

    render json: @packs
  end

  # GET /packs/1
  def show
    render json: @pack
  end

  # POST /packs
  def create
    @pack = Pack.new(pack_params)

    if @pack.save
      render json: @pack, status: :created, location: @pack
    else
      render json: @pack.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /packs/1
  def update
    if @pack.update(pack_params)
      render json: @pack
    else
      render json: @pack.errors, status: :unprocessable_entity
    end
  end

  # DELETE /packs/1
  def destroy
    @pack.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pack
    @pack = Pack.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pack_params
    params.require(:pack).permit(:name)
  end
end
