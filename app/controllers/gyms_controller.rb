class GymsController < ApplicationController

    def index
        render json: Gym.all, status: :ok
    end

    def show
        gym = find_gym
        render json: gym, status: :ok
    end

    def create
        gym = Gym.create!(gym_params)
        render json: gym, status: :created
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content
    end

    private

    def find_gym
        Gym.find(params[:id])
    end

    def gym_params
        params.permit(:id, :name, :address)
    end

    def render_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end

end
