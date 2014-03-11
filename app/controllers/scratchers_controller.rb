class ScratchersController < ApplicationController
  # GET /scratchers
  # GET /scratchers.json
  def index
    @scratchers = Scratcher.all

    render json: @scratchers
  end

  # GET /scratchers/1
  # GET /scratchers/1.json
  def show
    @scratcher = Scratcher.find(params[:id])

    render json: @scratcher
  end

  # POST /scratchers
  # POST /scratchers.json
  def create
    @scratcher = Scratcher.new(params[:scratcher])

    if @scratcher.save
      render json: @scratcher, status: :created, location: @scratcher
    else
      render json: @scratcher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /scratchers/1
  # PATCH/PUT /scratchers/1.json
  def update
    @scratcher = Scratcher.find(params[:id])

    if @scratcher.update(params[:scratcher])
      head :no_content
    else
      render json: @scratcher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scratchers/1
  # DELETE /scratchers/1.json
  def destroy
    @scratcher = Scratcher.find(params[:id])
    @scratcher.destroy

    head :no_content
  end
end
