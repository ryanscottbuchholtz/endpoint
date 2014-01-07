class ContactsController < ApplicationController

  def new
      @contact = Contact.new
  end

  def create
    @contact = Contact.new(set_params)

    if @contact.save
        redirect_to root_path, notice:"Success"
    else
        render :new
    end  
  end

  private

  def set_params
    params.require(:contact).permit(:first_name, :last_name, :email, :company)
  end

end