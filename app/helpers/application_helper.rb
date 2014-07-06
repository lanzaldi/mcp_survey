module ApplicationHelper
	def errors_for(model, attribute)
		if model.errors[attribute].present?
			content_tag :p, :class => 'error_explanation' do 
				model.errors[attribute] = "This question can't be left blank!"
			end
		end
	end
end
