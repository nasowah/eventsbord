class Registrant < ActiveRecord::Base
	validates :first_name, :last_name, :mobile, :email, :ticket, presence: true
	validates :mobile, numericality: true, length: { minimum: 10, maximum: 15 }
	validates :ticket, numericality: { greater_than: 0 }

	belongs_to :event
end
