class ClientsController < ApplicationController

    def index
        render json: Client.all, status: :ok
    end

    def show
        client = find_client
        render json: client, status: :ok
    end

    def create
        client = Client.create!(client_params)
        render json: client, status: :created
    end

    

    private

    def render_not_found
        render json: {error: "Client not found"}, status: :not_found
    end

    def client_params
        params.permit(:id, :name, :age)
    end

    def find_client
        Client.find(params[:id])
    end
end
