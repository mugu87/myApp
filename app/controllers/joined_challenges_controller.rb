class JoinedChallengesController < ApplicationController
	before_filter :set_user
	def new
		#TODO make sure the challenge is not expired
		@to_join = JoinedChallenge.new
		@to_join.challenge_id = params["challenge_id"]
		@to_join.user_id = params["user_id"]

	end

	# POST /users/:user_id/challenges/:challenge_id
	def create
	#	#raise challenge_params
	#	#@challenge = Challenge.new(challenge_params)
	#	@challenge = @user.challenges.build(challenge_params)
		@to_join = JoinedChallenge.new
		@to_join.challenge_id = params["challenge_id"]
		@to_join.user_id = params["user_id"]
		@to_join.kilo_walked = 0
		@to_join.kilo_ran = 0


		respond_to do |format|
			if @to_join.save #NOTE may have bugs here
				format.html { redirect_to user_challenges_url(@user), notice: 'User was successfully joined a challenge.' }
			else
				format.html { render action: 'new' }
				format.json { render json: @to_join.errors, status: :unprocessable_entity }
			end
		end
		
	end

	private
	def set_user
		@user = User.find(params["user_id"])
	end



end
