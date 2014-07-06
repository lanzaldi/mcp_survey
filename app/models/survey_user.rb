class SurveyUser < ActiveRecord::Base
	validates :email_digest, :participant_type, :age, :gender, :education, :length_of_time, presence: true
	#validates :care_for, presence: true, if: :caregiver?
	#validates :ms_type, presence: true, if: :ms?
	
	has_many :surveys, dependent: :destroy
	accepts_nested_attributes_for :surveys
	
	def self.caregiver?
		false
	end
	
	def self.ms?
		true
	end
	
	def self.initial_survey?(email = @email)
		SurveyUser.find_by(email_digest: Digest::SHA256.new.hexdigest(email)).nil?
	end
end
