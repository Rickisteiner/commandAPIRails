class RecipiesController < ApplicationController

	protect_from_forgery with: :null_session

	def index
		@recipies = Recipy.all
         render json: @recipies
    end

    def show
        @recipy = Recipy.find_by(id: params[:id])
          if @recipy
            render json: @recipy 
          else
            render status: 400, nothing: true
          end
    end

    def create
    	@recipy = Recipy.create(recipy_params)
          if @recipy.save
           render json: @recipy
          else
           render status: 400, nothing: true
          end
    end

    def update
        @recipy = Recipy.find_by(id: params[:id])
          if @recipy.update(recipy_params)
            render json: @pet
         else
            render status: 400, nothing: true
         end
    end

    def destroy
      @recipy = Recipy.find_by(id: params[:id])
        if @recipy.destroy
          render json: {}
        else
          render status: 400, nothing: true
        end
    end

    private
    def recipy_params
      params.require(:recipy).permit(:recipe_name, :ingrediants, :instructions)
    end
end