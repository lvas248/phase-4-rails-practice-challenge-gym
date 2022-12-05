class MembershipsController < ApplicationController


    def create
        mem = Membership.create!(membership_params)
        render json: mem, status: :created
    end

    private

    def membership_params
        params.permit(:id, :charge, :gym_id, :client_id)
    end
    

    
    
end
