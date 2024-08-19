class PermissionController < ApplicationController
    before_action :authorize_user, only: [:index, :create]

    def index
        @permissions = Permission.all
        render json: @permissions
    end 


    def create
        @permission = Permission.new(permission_params)
        if @permission.save
            render json: @permission, status: :created
        else
            render json: @permission.errors, status: :unprocessable_entity
        end

    end




    private

        def permission_params
            params.require(:permission).permit(:name, :code)
        end

        def authorize_user 
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
