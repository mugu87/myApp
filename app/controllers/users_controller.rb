class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!

	# GET /users
	# GET /users.json
	def index
		@users = User.all
	end

	# GET /users/1
	# GET /users/1.json
	def show
		@client = @user.fitbit_data
		@fitBitUserInfo = @client.user_info["user"]   #Note can get height, weight, stride length, name , weight units , height units, etc.... from here

    require 'json'
    #respond_to do |format|
      #      format.json{render :json => {:clientActToday => JSON.pretty_generate(@clientActToday),
      #                                   :trackerActToday => JSON.pretty_generate(@trackerDataForToday) }}
      #format.json{render :json => JSON.pretty_generate(@allActivities) }
     # format.json{render :json => JSON.pretty_generate(@display) }
    #end

		#TODO uncomment these once figuring out how to add the field device_type to user reg page
		# if (@user.device_type.eql?"fitbit")
		#     @user.update_fitbit_stats(@client)
		# end
		#
		# In the mean time, everyone is a fitbit client
		@user.update_fitbit_stats(@client)
	end

	# GET /users/new
	def new
		@user = User.new
	end

	# GET /users/1/edit
	def edit
	end

	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)

		respond_to do |format|
			if @user.save
				format.html { redirect_to @user, notice: 'User was successfully created.' }
				format.json { render action: 'show', status: :created, location: @user }
			else
				format.html { render action: 'new' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'User was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
		@myStats = @user.stats
		@myDonations = @user.donations
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:company_id, :device_type, :name, :user_type, :height, :weight, :gender, :dob, :email,
									 :provider, :uid, :oauth_token, :oauth_secret)
	end
end
