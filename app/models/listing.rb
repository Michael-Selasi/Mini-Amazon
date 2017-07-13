class Listing < ApplicationRecord
	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "default.jpg", validate_media_type: false
	else
		has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "default.jpg", validate_media_type: false
	  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/,
	  	#validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
		   	:storage => :dropbox,
		    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		    :dropbox_visibility => 'public',
		    :path => ":style/:id_:filename"
	end
validates :name, :description, :price, presence: true
validates :price, numericality: {greater_than: 0}
validates_attachment_presence :image
belongs_to :user
has_many :orders
validates_attachment_file_name :image, matches: [/png\z/, /jpe?g\z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :image

end
