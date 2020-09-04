class Api::V1::CarsController < ApplicationController
    #GET /cars
    def index
        @cars = .all
    end
    #Get /cars/1
    def show 
        @cars = Car.where(car_id : params[:id])
        render json { car :@car}
    end

    #POST /cars

    def create
        @car = Car.new(car_params)
        if @car.save
            render json: @car
        else 
            render json @car.errors, status: :unprocessable_entity
        end

    end

#PATCH/PUT cars/1

    def update 
         @car = Car.new(car_params)
         if @car.save
            render json: @car
         else
            render json: @car.errors, status: :unprocessable_entity
         end

            
    end

    def destroy
        @car.destroy

    end

    private

    def set_car
     @car = Car.find(params[:id])
    end

    def car_params
        params.require(:car).permit(:make, :model, :year, :color, :warranty, :price, :body_style, :milage)
    end
    





end

