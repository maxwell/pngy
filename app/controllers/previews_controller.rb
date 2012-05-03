class PreviewsController < ApplicationController
  # GET /previews
  # GET /previews.json
  def index
    @previews = Preview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @previews }
    end
  end

  # GET /previews/1
  # GET /previews/1.json
  def show
    @preview = Preview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @preview }
    end
  end

  # GET /previews/new
  # GET /previews/new.json
  def new
    @preview = Preview.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @preview }
    end
  end

  # GET /previews/1/edit
  def edit
    @preview = Preview.find(params[:id])
  end

  # POST /previews
  # POST /previews.json
  def create
    @preview = Preview.new(params[:preview])

    respond_to do |format|
      if @preview.save
        format.html { redirect_to @preview, notice: 'Preview was successfully created.' }
        format.json { render json: @preview, status: :created, location: @preview }
      else
        format.html { render action: "new" }
        format.json { render json: @preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /previews/1
  # PUT /previews/1.json
  def update
    @preview = Preview.find(params[:id])

    respond_to do |format|
      if @preview.update_attributes(params[:preview])
        format.html { redirect_to @preview, notice: 'Preview was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /previews/1
  # DELETE /previews/1.json
  def destroy
    @preview = Preview.find(params[:id])
    @preview.destroy

    respond_to do |format|
      format.html { redirect_to previews_url }
      format.json { head :ok }
    end
  end
end
