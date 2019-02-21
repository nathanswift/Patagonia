class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
    render partial: "form"
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @department.update(department_params)
      # redirect_to departments_path(@department) or a shortcut of ....
      redirect_to department_path(@department)
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_path
    # redirect_to root_path - you could change that to root but if you change the root it could be problematic
  end

  private
    def department_params
      params.require(:department).permit(:name)  
    end

    def set_department
      # localhost:3000/departments/:id
      @department = Department.find(params[:id])
      #this will now call this method at the start of every method so you can delete it from edit update destroy show
    end
end
