class Event < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
														:default_url => "default.gif"
	else
		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
														:default_url => "default.gif",
														:storage => :dropbox,
    												:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    												:path => ":style/:id_:filename" 
	end
	

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence :image


	validates :name, :description, :venue, :start_date, :end_date, :price, :organizer, :phone, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0 }

	belongs_to :user
end
