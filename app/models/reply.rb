class Reply

  def self.auto_reply(incoming_phone_number)
    RestClient::Request.new(
      method: :post,
      url: "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
      user: ENV['TWILIO_ACCOUNT_SID'],
      password: ENV['TWILIO_AUTH_TOKEN'],
      payload: { :Body => 'We will not reply because a robot',
                    :To => incoming_phone_number,
                    :From => '13237391269' }
    ).execute
  end

end
