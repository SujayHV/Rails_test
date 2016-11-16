class Event < ActiveRecord::Base
	 has_many :invitations
    has_many :invitees, foreign_key: :invitee_id, through: :invitations
end
