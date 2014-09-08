class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @contact = Contact.find(params[:contact_id])
    @message = Message.new
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @message = Message.new(message_params)
    if @message.save
      @contact.messages << @message
      flash[:notice] = "Message sent!"
      redirect_to contact_message_path(@contact, @message)
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
