class EventsController < ApplicationController
	def new
 		# binding.pry
  		@event = Event.new
	end

def create
  @event = Event.new(user_params)
  if @event.save
    redirect_to events_path, :notice => "Signed up!"
  else
    render "new"
  end
end
	private
	def user_params
		params.require(:event).permit(:title,:venu,:date,:time,:description,:invitees,:status)
	end
end
