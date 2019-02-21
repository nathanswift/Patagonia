class CategoriesController < ApplicationController
    before_action :set_department 
    before_action :set_category, only: [:show, :edit, :update, :destroy]
  
    def index
      @categories = @department.categories
    end
  
    def show
    end
  
    def new
      @category = @department.categories.new
      render partial: "form"
    end
  
    def create
      @category = @department.categories.new(category_params)
  
      if @category.save
        redirect_to department_category_path(@department, @category)
        # redirect_to [@department, @category] same thing just shorthand see rails routes
      else
        render partial: "form"
      end
    end
  
    def edit
      render partial: "form"
    end
  
    def update
      if @category.update(category_params)
        redirect_to [@department, @category] # see create right above if this doesn't make sense
      else
        render :edit
      end
    end
  
    def destroy
      @category.destroy
      redirect_to department_categories_path(@department) # this is wrong on the lecture!!! if there is a department_:id on the params field(middle field) you have to pass it in your method
    end
  
    private
      def set_department
        @department = department.find(params[:department_id])
      end
  
      def set_category
        @category = category.find(params[:id])
      end
  
      def category_params
        params.require(:category).permit(:name)
      end
end