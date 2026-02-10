class InvitesController < ApplicationController
  before_action :authenticate_user!

  def new
    @invite = Invite.new
  end

  def create
    user = User.find(params[:user_id])
    event = Event.find(params[:event_id])
    @invite = Invite.new(user_id: user.id, event_id: event.id)

    if @invite.save
      redirect_to event
    else
      puts @invite.errors.full_messages
      redirect_to event
    end
  end
end
