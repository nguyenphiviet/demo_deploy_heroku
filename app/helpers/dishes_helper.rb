module DishesHelper
  def show_image dish
    if dish.images.present?
      image_tag dish.images.first.url
    end
  end
end
