class RecensionsController < ApplicationController
  before_action :set_recension, only: [:show, :edit, :update, :destroy]

  # GET /recensions
  # GET /recensions.json
  def index
    @recensions = Recension.all
  end

  # GET /recensions/1
  # GET /recensions/1.json
  def show
  end

  # GET /recensions/new
  def new
    @recension = Recension.new
  end

  # GET /recensions/1/edit
  def edit
  end

  # POST /recensions
  # POST /recensions.json
  def create
    @recension = Recension.new(recension_params)

    respond_to do |format|
      if @recension.save
        format.html { redirect_to @recension, notice: 'Recension was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recension }
      else
        format.html { render action: 'new' }
        format.json { render json: @recension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recensions/1
  # PATCH/PUT /recensions/1.json
  def update
    respond_to do |format|
      if @recension.update(recension_params)
        format.html { redirect_to @recension, notice: 'Recension was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recensions/1
  # DELETE /recensions/1.json
  def destroy
    @recension.destroy
    respond_to do |format|
      format.html { redirect_to recensions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recension
      @recension = Recension.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recension_params
      params.require(:recension).permit(:movie_id, :website_id, :time, :content)
    end
end
