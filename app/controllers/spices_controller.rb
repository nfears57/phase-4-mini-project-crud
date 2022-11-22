class SpicesController < ApplicationController

    # GET /spices
    def index 
        spices = Spice.all
        render json: spices
    end
    
    #GET /spices/:id
    def show 
        spices = Spice.find_by(id: params[:id])
        render json: spices
    end

    #POST /spices
    def create
        spices = Spice.create(spice_params)
        render json: spices, status: :created
    end

    #PATCH /spices/:id
    def update
        spices = Spice.find_by(id: params[:id])
        spices.update(spice_params)
        render json: spices
    end

    def destroy
        spices = Spice.find_by(id: params[:id])
        spices.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end