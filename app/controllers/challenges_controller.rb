class ChallengesController < ApplicationController
	#before_action only: [:show, :edit, :update, :destroy]
	before_filter :set_user

	# GET /challenges
	# GET /challenges.json
	def index
		@my_supporting_challenges = @user.challenges
		@my_joined_challenges = JoinedChallenge.where("user_id = ?", @user.id)
		@my_unjoined_challenges = JoinedChallenge.where("user_id != ?", @user.id)
	end

	def join_challenge (chal_id)
		#TODO make sure the challenge is not expired
		@to_join = JoinedChallenge.new
		@to_join.challenge_id = chal_id
		@to_join.user_id = @user.id

	end

	# GET /challenges/1
	# GET /challenges/1.json
	def show
	end

	# GET /challenges/new
	def new
		@challenge = @user.challenges.build
	end

	# GET /challenges/1/edit
	def edit
	end

	# POST /challenges
	# POST /challenges.json
	def create
		#raise challenge_params
		#@challenge = Challenge.new(challenge_params)
		@challenge = @user.challenges.build(challenge_params)

		respond_to do |format|
			if @challenge.save
				#raise params
				#format.html { redirect_to user_url(User.find(params["user_id"])), notice: 'Challenge was successfully created.' }
				#format.html { redirect_to user_url(set_user), notice: 'Challenge was successfully created.' }
				format.html { redirect_to user_challenges_url(set_user), notice: 'Challenge was successfully created.' }
				format.json { render action: 'show', status: :created, location: @challenge }
			else
				format.html { render action: 'new' }
				format.json { render json: @challenge.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /challenges/1
	# PATCH/PUT /challenges/1.json
	def update
		respond_to do |format|
			if @challenge.update(challenge_params)
				format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @challenge.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /challenges/1
	# DELETE /challenges/1.json
	def destroy
		@challenge.destroy
		respond_to do |format|
			format.html { redirect_to challenges_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_challenge
		@challenge = Challenge.find(params[:id])
	end

	def set_user
		@user = User.find(params["user_id"])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def challenge_params
		params.require(:challenge).permit(:cost_per_completion, :expiration, :kilo_to_walk, :kilo_to_run,:calories_to_burn)
	end
end
