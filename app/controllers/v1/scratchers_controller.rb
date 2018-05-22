module V1
  class ScratchersController < ApplicationController
    before_action :set_scratcher, only: [:show, :update, :destroy]

    # GET /scratchers
    def index
      @scratchers = Scratcher.all
      json_response(@scratchers)
    end

    # POST /scratchers
    def create
      @scratcher = Scratcher.create!(scratcher_params)
      json_response(@scratcher, :created)
    end

    # GET /scratchers/:id
    def show
      json_response(@scratcher)
    end

    # PUT /scratchers/:id
    def update
      @scratcher.update(scratcher_params)
      head :no_content
    end

    # DELETE /scratchers/:id
    def destroy
      @scratcher.destroy
      head :no_content
    end

    private

    def scratcher_params
      # whitelist params
      params.permit(:name, :description, :size, :price)
    end

    def set_scratcher
      @scratcher = Scratcher.find(params[:id])
    end
  end
end
