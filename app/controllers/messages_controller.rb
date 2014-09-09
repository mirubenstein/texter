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
    phones = message_params[:to]
    phones.pop
    phones.each do |phone|
      @message = Message.new(message_params)
      @message.to = phone
      if @message.save
        @contact.messages << @message
      end
    end
    if @message.errors.any?
      render 'new'
    else
      flash[:notice] = "Message sent!"
      redirect_to contact_message_path(@contact, @message)
    end
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit({:to => []}, :from, :body)
  end
end
