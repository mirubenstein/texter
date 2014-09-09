require 'rails_helper'

describe Reply do

  it "responds to an inbound text message", vcr: true do
    allow(Reply).to receive :auto_reply
    expect(Reply).to receive :auto_reply
    Message.create(body: "hey", to: '3237391269', from: '15005550006')
  end

end
