require 'twilio-ruby'

class Sms

  def initialize(env, client = nil)
    @env = env
    @client = client || Twilio::REST::Client.new(env["TWILIO_ACCOUNT_SID"], env["TWILIO_AUTH_TOKEN"])
  end
    
  def send_sms
    @client.messages.create(message_contents)
  end
  
  def message_contents
    { from: @env['TWILIO_PHONE_NO'],
    to: @env['PHONE_NO'],
    body: "Thank you for your order: £20.93. It will be delivered #{arrival_time}." }
  end

  def arrival_time
    time = Time.now + 3600
    time.strftime("%H:%M")
  end


end