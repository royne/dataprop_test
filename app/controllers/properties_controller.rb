class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_property, only: %i[edit update]
  before_action :authorize_user!, only: %i[edit update]

  def index
    @properties = Property.paginate(page: params[:page], per_page: 2)
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = current_user.properties.new
  end

  def create
    @property = current_user.properties.new(property_params)
    if @property.save
      redirect_to @property, notice: "Property created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property updated."
    else
      render :edit
    end
  end

  private

  def set_property
    @property = current_user.properties.find(params[:id])
  end

  def authorize_user!
    unless @property.user == current_user
      redirect_to properties_path, alert: "not authorized"
    end
  end

  def property_params
    params.require(:property).permit(:property_type, :price, :currency, :commune, :address, :area, :bedrooms, :bathrooms, :latitude, :longitude, :description, :photo)
  end
end
