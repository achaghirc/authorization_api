class ActionsController < ApplicationController
    before_action :authorized_user, only: [:create, :index]
    def index
        @actions = Action.all
        render json: @actions
    end

    def create
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

        def authorized_user
            if params[:user_permissions_code] == nil 
                render json:{error: 'Bad request, forgotted user_permission_code'}, status: :bad_request 
            else 
                permissions_code = params[:user_permissions_code]
                authorized = false
                @permissions = Permission.where(code: permissions_code)
                @permissions.each do |permission|
                    if permission && permission.code == 'IT_ADMIN'
                        authorized = true
                        break
                    end
                end
                if !authorized
                    render json: { error: 'You are not authorized to do this action' }, status: :unauthorized
                end
            end
        end 

end
