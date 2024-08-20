module AuthorizationConcern
  extend ActiveSupport::Concern

  included do
    before_action :authorize_user!, only: [:update, :destroy, :create, :list_permissions]
    
  end

  def authorize_user!
    if params[:user_permissions_code] == nil 
        render json:{error: 'Bad request, forgotted user_permissions_code'}, status: :bad_request 
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