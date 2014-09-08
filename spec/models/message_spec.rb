require 'rails_helper'

describe Message do
  it "sends a message" do
    message = Message.new(body: "hey", to: '2073709461', from: '15005550006')
    expect(message.save).to eq true
  end
end
