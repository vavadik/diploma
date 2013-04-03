module ApplicationHelper
	def navigation_bar(current = nil)
		[
			{
				text: 'Users',
				link: users_path,
				class: current == :users ? 'active' : ''
			},
		]
	end

	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end
end
