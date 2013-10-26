class NposController < ApplicationController
  before_action :set_npo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /npos
  # GET /npos.json
  def index
    @npos = Npo.all
  end

  # GET /npos/1
  # GET /npos/1.json
  def show
  end

  # GET /npos/new
  def new
    @npo = Npo.new
  end

  # GET /npos/1/edit
  def edit
  end

  # POST /npos
  # POST /npos.json
  def create
    @npo = Npo.new(npo_params)

    respond_to do |format|
      if @npo.save
        format.html { redirect_to @npo, notice: 'Npo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @npo }
      else
        format.html { render action: 'new' }
        format.json { render json: @npo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /npos/1
  # PATCH/PUT /npos/1.json
  def update
    respond_to do |format|
      if @npo.update(npo_params)
        format.html { redirect_to @npo, notice: 'Npo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @npo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /npos/1
  # DELETE /npos/1.json
  def destroy
    @npo.destroy
    respond_to do |format|
      format.html { redirect_to npos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_npo
      @npo = Npo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def npo_params
      params.require(:npo).permit(:name, :rate, :address, :phone, :email)
    end
end
