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
end
