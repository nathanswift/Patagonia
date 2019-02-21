class ItemsController < ApplicationController
  before_action :set_category
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = @category.items
  end

  def show
  end

  def new
    @item = @category.items.new
    render partial: "form"
  end

  def create
    @item = @category.items.new(item_params)

    if @item.save
      redirect_to category_item_path(@category, @item)
      # redirect_to [@category, @item] same thing just shorthand see rails routes
    else
      render partial: "form"
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to [@category, @item] # see create right above if this doesn't make sense
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to category_items_path(@category) # this is wrong on the lecture!!! if there is a category_:id on the params field(middle field) you have to pass it in your method
  end

  private
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name)
    end
end