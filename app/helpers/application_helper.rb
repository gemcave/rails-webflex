module ApplicationHelper
	def page_title
		if content_for?(:title)
			content_tag(:title, "Flix - #{content_for(:title)}")
		else
			content_tag(:title, "Flix")
		end
	end
	
	def title(title)
		content_for(:title, title)
	end
end
