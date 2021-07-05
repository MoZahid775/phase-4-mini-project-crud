class SpicesController < ApplicationController

def index
spice = Spice.all
render json: spice
end


def show
    spice = Spice.find(params[:id])
    render json: spice
end


def create
spice = Spice.create(title: params[:title], image: params[:image], 
description: params[:description], notes: params[:notes], rating: params[:rating])
render json: spice
end


def update
spice = Spice.find(params[:id])
spice.update(spice_params)
render json: spice
rescue ActiveRecord::RecordNotFound
    render json: {error: "bird not found"}, status: :not_found  
end


def destroy

spice = Spice.find_by(id:params[:id])


if spice
    spice.destroy
    render json: {success: "bird has been deleted"}
else
    render json: {error: "bird not found"}, status: :not_found    
    
end

end


private
  def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
  end
end








