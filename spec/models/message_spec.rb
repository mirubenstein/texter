require 'rails_helper'

describe Message, vcr: true do
  it "sends a message" do
    message = Message.new(body: "hey", to: '2073709461', from: '15005550006')
    expect(message.save).to eq true
  end

  it 'adds an error if the to number is invalid' do
    message = Message.new(body: 'hi', to: '1111111', from: '15005550006')
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 1111111 is not a valid phone number."]
  end

  it 'adds an error if the from number is invalid' do
    message = Message.new(body: 'hi', to: '2073709461', from: '555')
    message.save
    expect(message.errors.messages[:base]).to eq ["The From phone number 555 is not a valid, SMS-capable inbound phone number or short code for your account."]
  end
end
