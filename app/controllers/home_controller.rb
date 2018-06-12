class HomeController < ApplicationController
  def index
    @q = Table.ransack params[:q]
    @lastest_dishes = Dish.lastest Settings.home.dish_popular_number
    @popular_dishes = Dish.most_popular_dishes
    @supports = Supports::Home.new @lastest_dishes, @popular_dishes
  end

  def contact
    @contact = Contact.new
  end

  def send_contact
    @contact = Contact.new contact_params
    if @contact.save
      flash[:success] = t ".success"
      redirect_to root_path
    else
      flash[:error] = t ".error"
      render :contact
    end
  end

  private
  def contact_params
    params.require(:contact).permit :first_name, :last_name, :email,
      :subject, :message
  end
end
