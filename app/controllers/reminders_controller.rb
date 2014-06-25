class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.create(:title => params[:title], :content => params[:content], :phone => params[:phone], :date => params[:date])
    flash[:created] = "You've scheduled a reminder"
    redirect_to "/users/#{current_user.id}/reminders/#{@reminder.id}"
  end

  def index

  end

  def show
    @reminder = Reminder.find(params[:id])
  end

end
