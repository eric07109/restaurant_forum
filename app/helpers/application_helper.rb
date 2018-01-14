module ApplicationHelper
	def current_nav_page?(test_path)
		'active' if request.path == test_path
	end
end
