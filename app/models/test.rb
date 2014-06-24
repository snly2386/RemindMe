require 'dotenv'
Dotenv.load
require 'twilio-ruby'

# put your own credentials here
account_sid = ENV['TWILIO_SECRET']
auth_token = ENV['TWILIO_AUTH']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

def send_message
@client.account.messages.create(
  :from => '+19186750208',
  :to => '+18085617268',
  :body => 'Im watching you'
)
end