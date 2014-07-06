class SurveyUsersController < ApplicationController
	
	def new
		@survey_user = SurveyUser.new
		@survey = @survey_user.surveys.new
		@email = "test@test3.com"
	end
	
	def create
	
		#extract from user meta data: GENDER, EMAIL (for unique_id), AGE*, PARTICIPANT_TYPE, TYPE_OF_MS, TIME_SINCE_DIAGNOSIS* (if ms_patient)
			@email = "test@test3.com"
			@gender = "male"
			@age = "1991-05-12"
			@ms_type = "relapsing-remitting"
			@dx = "2012-10-23"
			@person_type = "ms"
		
		@email_digest = Digest::SHA256.new.hexdigest(@email)
		@survey_user = SurveyUser.find_by(email_digest: @email_digest)
		
		if @survey_user.nil?
			@survey_user = SurveyUser.new(survey_user_params)
			@survey_user.email_digest = @email_digest
			@survey_user.gender = @gender
			@survey_user.age = convert_age(time_since(@age))
			@survey_user.participant_type = @person_type
			
			if(@survey_user.participant_type == "ms")
				@survey_user.ms_type = @ms_type
				@survey_user.length_of_time = convert_time_dx(time_since(@dx))
			end
			
			new_user = true
		else
			new_user = false
		end
		
		@survey = @survey_user.surveys.build(survey_params)
		if (!new_user &&  @survey.save)  || (new_user && @survey_user.save)
			redirect_to thankyou_path
		else
			render 'new'
		end
	end
	
	
	# Note: survey should only be presented to those >=18
	def convert_age (age_ym)
		age = age_ym[:y]
		case age
			when 18..30
				"18-30"
			when 31..40
				"31-40"
			when 41..50
				"41-50"
			when 51..60
				"51-60"
			when 61..70
				"61-70"
			when 71..80
				"71-80"
			when a > 80
				"80+"
			else
				nil
		end
	end
	
	def convert_time_dx  (dx_ym)
		yrs = dx_ym[:y]
		if yrs == 0
			if dx_ym[:m] < 6 
				"< 6 months"
			else
				"6 months-1 year"
			end
		else
			if yrs < 2
				"1-2 years"
			elsif yrs < 3 
				"2-3 years"
			elsif yrs < 4
				"3-4 years"
			elsif yrs < 5
				"4-5 years"
			else
				"5+ years"
			end
		end
	end
		
	
	def time_since (date)
		now = Time.now.utc.to_date
		date = date.to_date
		years = now.year - date.year - ((now.month > date.month || (now.month == date.month && now.day >= date.day)) ? 0 : 1)
		months = date.month > now.month ? 12 - (now.month - date.month).abs : (now.month - date.month).abs
		{ :y => years, :m => months }
	end		
			

	
	private
		def survey_user_params
			params.require(:survey_user).permit(:education, :length_of_time, :care_for)
		end
		
		def survey_params
			@pils = []
			20.times do |n|
				@pils[n] = "pil#{n+1}".to_sym
			end
			params.require(:survey).permit(:marital_status, :employment, @pils, :last_exacerbation, :new_symptoms, :disability)
		end


end

