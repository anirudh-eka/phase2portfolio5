class Event < ActiveRecord::Base
	validates_presence_of :date, :title, :organizer_name, :organizer_email
	validate :email_verification
	validate :date_is_not_in_past
	validates_uniqueness_of :title

	def email_verification
		errors.add(:organizer_email, "email is not valid") unless organizer_email =~ (/.+[@][a-zA-Z]+[.][a-z]+/)
	end

	def date_is_not_in_past
		unless Chronic.parse(date).nil?
			errors.add(:date, "has already passed") if Chronic.parse(date) < Time.now
		end
	end
end
