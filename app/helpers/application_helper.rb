module ApplicationHelper
  def show_image dish
    dish = Dish.find_by id: dish.id
    if dish
      image_tag(dish.images.first.url, class: "img-responsive") if dish.images.present?
    end
  end

  def currency_format number
    number_to_currency(number, separator: ",", delimiter: ".")
  end
end
