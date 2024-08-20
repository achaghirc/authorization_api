class ActionsController < ApplicationController
    include AuthorizationConcern
    def index
        @actions = Action.all
        render json: @actions
    end

    def create
        @actionDB = Action.find_by(code: action_params[:code])
        if @actionDB
            render json: @actionDB, status: :ok
            return
        end

        @action = Action.new(action_params)
        permission_code = params[:permission_code]
        if @action.save
            @permission = Permission.find_by(code: permission_code)
            @action_permission = ActionPermission.new(action_id: @action.id, permission_id: @permission.id)
            if @action_permission.save
                puts 'Action permission created'
            end
            render json: @action, status: :created
        else
            render json: @action.errors, status: :unprocessable_entity
        end
    end


    private 
        def action_params
            params.require(:actions).permit(:name, :code, :application_id, :permission_code)
        end
end
