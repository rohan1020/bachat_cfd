class CallplansController < ApplicationController
  before_action :set_callplan, only: [:show, :edit, :update, :destroy]

  # GET /callplans
  # GET /callplans.json
  def index
    @callplans = Callplan.all
  end

  # GET /callplans/1
  # GET /callplans/1.json
  def show
  end

  # GET /callplans/new
  def new
    @callplan = Callplan.new
  end

  # GET /callplans/1/edit
  def edit
  end

  # POST /callplans
  # POST /callplans.json
  def create
    @callplan = Callplan.new(callplan_params)

    respond_to do |format|
      if @callplan.save
        format.html { redirect_to @callplan, notice: 'Callplan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @callplan }
      else
        format.html { render action: 'new' }
        format.json { render json: @callplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /callplans/1
  # PATCH/PUT /callplans/1.json
  def update
    respond_to do |format|
      if @callplan.update(callplan_params)
        format.html { redirect_to @callplan, notice: 'Callplan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @callplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /callplans/1
  # DELETE /callplans/1.json
  def destroy
    @callplan.destroy
    respond_to do |format|
      format.html { redirect_to callplans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_callplan
      @callplan = Callplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def callplan_params
      params.require(:callplan).permit(:name, :description, :price, :network, :state, :plantype, :ratepersec, :ratepermin, :ratepersec_std, :ratepermin_std)
    end
end
