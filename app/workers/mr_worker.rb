class MrWorker
  include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(reminder_id)

    @reminder = Reminder.find(reminder_id)
    #twilio api
    account_sid = ENV['TWILIO_SECRET']
    auth_token = ENV['TWILIO_AUTH']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    #send request to API
    @client.account.messages.create(
      :from => '+19186750208',
      :to => '+18085617268',
      :body => @reminder.content
   )

    @reminder.status = "Message Sent"
    @reminder.save
  end
end