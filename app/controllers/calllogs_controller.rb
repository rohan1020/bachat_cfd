class CalllogsController < ApplicationController
  before_action :set_calllog, only: [:show, :edit, :update, :destroy]

  # GET /calllogs
  # GET /calllogs.json
  def index
    @calllogs = Calllog.all
  end

  # GET /calllogs/1
  # GET /calllogs/1.json
  def show
  end

  # GET /calllogs/new
  def new
    @calllog = Calllog.new
  end

  # GET /calllogs/1/edit
  def edit
  end

  # POST /calllogs
  # POST /calllogs.json
  def create
    @calllog = Calllog.new(calllog_params)

    respond_to do |format|
      if @calllog.save
        format.html { redirect_to @calllog, notice: 'Calllog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @calllog }
      else
        format.html { render action: 'new' }
        format.json { render json: @calllog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calllogs/1
  # PATCH/PUT /calllogs/1.json
  def update
    respond_to do |format|
      if @calllog.update(calllog_params)
        format.html { redirect_to @calllog, notice: 'Calllog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @calllog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calllogs/1
  # DELETE /calllogs/1.json
  def destroy
    @calllog.destroy
    respond_to do |format|
      format.html { redirect_to calllogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calllog
      @calllog = Calllog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calllog_params
      params.require(:calllog).permit(:user_id, :caller, :duration, :called_on)
    end
end
