class SdadObjsController < ApplicationController
  before_action :set_sdad_obj, only: [:show, :edit, :update, :destroy]

  # GET /sdad_objs
  def index
    @sdad_objs = SdadObj.all
  end

  # GET /sdad_objs/1
  def show
  end

  # GET /sdad_objs/new
  def new
    @sdad_obj = SdadObj.new
  end

  # GET /sdad_objs/1/edit
  def edit
  end

  # POST /sdad_objs
  def create
    @sdad_obj = SdadObj.new(sdad_obj_params)

    if @sdad_obj.save
      redirect_to @sdad_obj, notice: 'Sdad obj was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sdad_objs/1
  def update
    if @sdad_obj.update(sdad_obj_params)
      redirect_to @sdad_obj, notice: 'Sdad obj was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sdad_objs/1
  def destroy
    @sdad_obj.destroy
    redirect_to sdad_objs_url, notice: 'Sdad obj was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sdad_obj
      @sdad_obj = SdadObj.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sdad_obj_params
      params.require(:sdad_obj).permit(:published, :archived)
    end
end
