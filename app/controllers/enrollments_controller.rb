class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @enrollment = Enrollment.new
  end

  def create
    event = Event.find(params[:event_id])
    if !current_user.attended_events.exists?(event.id)
      @enrollment = Enrollment.new(user_id: current_user.id, event_id: event.id)
      if @enrollment.save
        redirect_to event
      else
        redirect_to event
      end
    else
      flash[:notice] = "Already attending event"
      redirect_to event
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy

    redirect_to current_user, notice: "No longer attending event"
  end
end
