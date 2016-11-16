class Event < ActiveRecord::Base
	 has_many :invitations
    has_many :invitee, foreign_key: :invitee_id, through: :invitations
end
