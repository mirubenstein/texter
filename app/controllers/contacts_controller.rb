class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact created!"
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

private
  def contact_params
    params.require(:contact).permit(:name, :phone)
  end
end
