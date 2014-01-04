class ApiController < ApplicationController
	protect_from_forgery :except => [:test]	

	def update_calories
		raise params.inspect
	end

	def user_info
	end

  #POST /api/test.json
  def test
  	response = params[:api]
  	require 'json'
  	respond_to do |format|
  		format.json { render :json => JSON.pretty_generate(response)}
  	end
  end
end
