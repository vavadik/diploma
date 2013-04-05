module ApplicationHelper
	def navigation_bar(current = nil)
		[
			{
				text: 'News',
				link: :news,
				class: current == :news ? 'active' : ''
			},
			{
				text: 'Users',
				link: :users,
				class: current == :users ? 'active' : ''
			},
		]
	end
end
