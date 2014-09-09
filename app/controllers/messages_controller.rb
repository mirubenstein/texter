class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    phones = message_params[:to]
    phones.pop
    phones.each do |phone|
      contact = Contact.find_by(phone: phone)
      @message = Message.new(message_params)
      @message.to = phone
      if @message.save
        contact.messages << @message
      end
    end
    if @message.errors.any?
      render 'new'
    else
      flash[:notice] = "Message sent!"
      redirect_to message_path(@message)
    end
  end

  def show
    @message = Message.find(params[:id])
  end

private
  def message_params
    params.require(:message).permit({:to => []}, :from, :body)
  end
end
