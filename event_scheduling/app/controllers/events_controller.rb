class EventsController < ApplicationController
  before_filter :find_user
  def new
    # binding.pry
      @event = Event.new
      # @events = Event.find_by
      @myusers = User.all
  end

def create
  @event = Event.new(event_params)
  @event.save
  params[:role_ids].each do |f|
  @invitation=Invitation.new
  @invitation.event_id= @event.id
  @invitation.inviter_id= params[:user_id]
  @invitation.invitee_id=f
@invitation.save  
end


 if @event.save
    redirect_to user_events_path

else
  render "new"
end


  
end

def index 
  @events=@user.events
  # @users = User.all
      @myusers = User.all



end

def edit 
  @event=Event.find_by_id(params[:id])
  
  end

  def update
    @event=Event.find_by_id(params[:id])
    @event.update_attributes(event_params)
    redirect_to user_events_path
  end





  private
  def event_params
    # binding.pry
    params.require(:event).permit(:title,:venue,:date,:time,:description,:invitees,:status)
  end
  def find_user
    @user=User.find_by_id(params[:user_id])
  end
end