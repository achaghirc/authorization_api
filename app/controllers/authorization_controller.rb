class AuthorizationController < ApplicationController


    ##POST /authorization/:application_id/:action_code/:permissions_code[]
    def index
        application_id = params[:application_id]
        action_code = params[:action_code]
        permissions_code = params[:permissions_code]
        logger.debug("Here is the permissions_code --> #{permissions_code}")
        @action = Action.find_by(application_id: application_id, code: action_code)
        if @action
            @permissions = Permission.where(code: permissions_code)
            logger.debug("Here are the permissions --> #{@permissions}")
            authorized = false
            # Iteramos sobre los permisos para comprobar la autorización
            @permissions.each do |permission|
                logger.debug("Here is the permission --> #{permission}")
                @action_permission = ActionPermission.find_by(action_id: @action.id, permission_id: permission.id)
                if @action_permission
                    authorized = true
                    break # Salimos del bucle si encontramos un permiso autorizado
                end
            end
    
            if authorized
                render status: :ok
            else
                render json: { error: 'You are not authorized to do this action' }, status: :unauthorized
            end
        else
            render json: {error: 'Action not found'}, status: :not_found
        end
    end
end
