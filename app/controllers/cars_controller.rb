# frozen_string_literal: true

class CarsController < ApplicationController
  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    @car_models = CarModel.all
  end

  def create
    @car = Car.new(car_params)
    return redirect_to @car if @car.save

    @car_models = CarModel.all
    render :new
  end

  private

  def car_params
    params.require(:car).permit(%i[car_model_id car_km color license_plate])
  end
end