require 'dotenv'
Dotenv.load
require 'twilio-ruby'
require 'active_support/all'


class RemindersController < ApplicationController
  def new
   
  end

  def create
    @reminder = Reminder.create(:mystery => params[:date], :user_id => current_user.id, :content => params[:content], :title => params[:title], :phone => params[:phone], :status => "pending", :tim => params["time"]["(4i)"] + ":" + params["time"]["(5i)"])
    # grab datetime from params
    @datetime = @reminder.mystery + " " + @reminder.tim 
    @year = @datetime[6..9]
    @month = @datetime[0..1]
    @day = @datetime[3..4]
    @time = @datetime[11..-1]
    @new = @year + "/" + @month + "/" + @day + " " + @time
    @date = DateTime.parse(@new)

    #parse datetime to be used in sidekiq
    @date_parsed = @date.to_s
    @date_parsed[10] = " "
    @date_parsed[16..-1] = ""
    @parsed = Time.parse(@date_parsed)


    @difference = @parsed - Time.now
    @minutes = @difference / 60
    MrWorker.perform_in(@minutes.minutes , @reminder.id)
    flash[:created] = "You've scheduled a reminder"
    redirect_to "/users/#{current_user.id}/reminders/#{@reminder.id}"
  end

  def index
    @reminders = Reminder.where(:user_id => current_user.id)
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  # private

  # def reminder_params
  #   params.require(:reminder).permit(:title, :content, :phone, :date)
  # end

end
