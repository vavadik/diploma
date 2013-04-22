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
			{
				text: 'Gallery',
				link: :gallery,
				class: current == :gallery ? 'active' : ''
			},
			{
				text: 'Chat',
				link: :chat,
				class: current == :chat ? 'active' : ''
			},
		]
	end
end
