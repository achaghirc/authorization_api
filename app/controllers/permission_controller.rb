class PermissionController < ApplicationController
    include AuthorizationConcern

    def list_permissions
        @permissions = Permission.all
        render json: @permissions
    end 


    def create
        @permissionDB = Permission.find_by(code: permission_params[:code])
        if @permissionDB
            render json: @permissionDB, status: :ok
            return
        end
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
end
