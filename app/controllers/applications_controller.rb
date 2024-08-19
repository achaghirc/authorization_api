class ApplicationsController < ApplicationController
    before_action :authorize_user, only: [:index, :update, :destroy]
    
    #GET /applications
    def index
        @applications = Application.all
        render json: @applications
    end

    #GET /applications/:id
    def show
        @application = Application.find(params[:id])
        @action = Action.find_by_application_id(params[:id])

        render json: @application
    end


    #POST /applications
    def create
        @application = Application.new(application_params)
        if @application.save
            render json: @application, status: :created
        else
            render json: @application.errors, status: :unprocessable_entity
        end
    end

    #PATCH/PUT /applications/:id
    def update
        @application = Application.find(params[:id])
        if @application.update(application_params)
            render json: @application
        else
            render json: @application.errors, status: :unprocessable_entity
        end
    end

    #DELETE /applications/:id
    def destroy
        @application = Application.find(params[:id])
        @application.destroy
    end

    #User callbacks to share common setup or constraints between actions.
    private
        def set_application
            @application = Application.find(params[:id])
        end

        #Only allow a trusted parameter "white list" through.
        def application_params
            params.require(:application).permit(:name)
        end

        def authorize_user
            print('here is the authorize: ',request.headers["Authorization"])
        end
end
