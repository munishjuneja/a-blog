class WelcomeController < ApplicationController
		
		def initialize

		end

		def test
			redirect_to articles_path if logged_in?
		end

		def about

		end
end