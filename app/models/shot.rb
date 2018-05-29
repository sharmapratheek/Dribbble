class Shot < ApplicationRecord
	belongs_to :user
	mount_uploader :user_shot , UserShotUploader
	is_impressionable
	acts_as_votable
	has_many :comments , dependent: :destroy
end
