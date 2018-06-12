class DishesController < ApplicationController
  before_action :load_categories, only: %i(show)

  def show
    @dish = Dish.find_by id: params[:id]
    unless @dish
      flash[:danger] = t ".cant_find"
      redirect_to root_url
    end
  end

  def load_categories
    @categories = Category.ordered_by_name
  end
end
