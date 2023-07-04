class PowersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_not_valid_response
    def index
        powers = Power.all
        render json: powers
    end
    def show
        power = find_power
        render json: power 
    end
    def update
        power = find_power
        power.update!(params_description)
        render json: power
    end
    private
    def find_power
        Power.find(params[:id])
    end
    def params_description
        params.permit(:name, :description)
    end
    def render_not_found_response
        render json: { errors: "Power not found" }, status: :not_found
    end
    def render_not_valid_response
        render json: { error: ["validation errors"] }, status: :unprocessable_entity
    end
end


