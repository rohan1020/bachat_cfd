class McirclesController < ApplicationController
  before_action :set_mcircle, only: [:show, :edit, :update, :destroy]

  # GET /mcircles
  # GET /mcircles.json
  def index
    @mcircles = Mcircle.all
  end

  # GET /mcircles/1
  # GET /mcircles/1.json
  def show
  end

  def querynum
    q = params['q']

    m = Mcircle.where(:number => q[0..3]).first

    render :text => m.state + ", " + m.network
  end

  def parse

    page = Nokogiri::HTML(open("public/circles.html"))
    tables = page.css(".wikitable")

    rows = tables[1].css('tr')
    outp = ""

    rows.each do |r|
      entries = r.css('td')
      outp = outp + row_parser(entries, rows)
    end

    
    render :text => outp

  end

  def row_parser(entries, rows)

    outp = ""
    num_nums = 0

    for i in 0..entries.length

      if (isNum(entries[i].to_s)) then

        mCircle = Mcircle.new
        mCircle.number = entries[i].text
        

         outp = outp + entries[i].to_s + "," 
         outp = outp + entries[i+1].to_s + ","

        if(isNum(entries[i+2].to_s))
          mCircle.state = entries[i+1].text
          mCircle.network = rows.first.css('th')[num_nums*2].text

          #outp = outp + rows.first.css('th')[num_nums*2] + "NetworkHead<hr>"
          outp = outp + rows.first.css('th')[num_nums*2].text + "<hr>"
        else
          mCircle.state = entries[i+2].text
          mCircle.network = entries[i+1].text
          #outp = outp + "Triplet<hr>"
          outp = outp + entries[i+2].to_s + "<hr>"
        end

        num_nums = num_nums + 1
        mCircle.save

      end

     # outp = outp + isNum(entries[i].to_s).to_s + "<HR>"

    end

    return outp
  end

  def isNum(str)
    return str.length == 13
  end

  def isTriplet(str)

  end

  # GET /mcircles/new
  def new
    @mcircle = Mcircle.new
  end

  # GET /mcircles/1/edit
  def edit
  end

  # POST /mcircles
  # POST /mcircles.json
  def create
    @mcircle = Mcircle.new(mcircle_params)

    respond_to do |format|
      if @mcircle.save
        format.html { redirect_to @mcircle, notice: 'Mcircle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mcircle }
      else
        format.html { render action: 'new' }
        format.json { render json: @mcircle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mcircles/1
  # PATCH/PUT /mcircles/1.json
  def update
    respond_to do |format|
      if @mcircle.update(mcircle_params)
        format.html { redirect_to @mcircle, notice: 'Mcircle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mcircle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mcircles/1
  # DELETE /mcircles/1.json
  def destroy
    @mcircle.destroy
    respond_to do |format|
      format.html { redirect_to mcircles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mcircle
      @mcircle = Mcircle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mcircle_params
      params.require(:mcircle).permit(:number, :state, :network)
    end
end
