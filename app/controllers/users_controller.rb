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
    #@client = @user.fitbit_data
    @client = @user.fitbit_data
    @allActivities = @client.activities
    #raise @client.data_by_time_range("/activities/log/activityCalories", {:base_date => "2013-11-05", :period => "7d"}).to_json
    @fitBitUserInfo = @client.user_info["user"]   #Note can get height, weight, stride length, name , weight units , height units, etc.... from here
    @recentFitBitActivities = @client.recent_activities #NOTE may need this to make updates?
    @clientActToday = @client.activities_on_date(Date.today)
    # @clientAct1DayAgo= @client.activities_on_date(Date.today - 1)
    # @clientAct2DayAgo= @client.activities_on_date(Date.today - 2)
    # @clientAct3DayAgo= @client.activities_on_date(Date.today - 3)
    # @clientAct4DayAgo= @client.activities_on_date(Date.today - 4)
    # @clientAct5DayAgo= @client.activities_on_date(Date.today - 5)
    @trackerDataForToday= @client.data_by_time_range("/activities/tracker/calories", {:base_date => Date.today, :period => "1d"})
    @display = @clientActToday.merge @trackerDataForToday

    #require 'json'
    #respond_to do |format|
    #  #      format.json{render :json => {:clientActToday => JSON.pretty_generate(@clientActToday),
    #  #                                   :trackerActToday => JSON.pretty_generate(@trackerDataForToday) }}
    #  #format.json{render :json => JSON.pretty_generate(@allActivities) }
    #  format.json{render :json => JSON.pretty_generate(@display) }
    #end

    #raise @recentFitBitActivities.to_s 
    #raise @clientActToday.to_json
    #raise @client.methods.sort.to_s #NOTE use this to check all of the methods of @client
    #raise @fitBitUserInfo.class.to_s


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
    params.require(:user).permit(:company_id, :name, :user_type, :height, :weight, :gender, :dob, :email,
                                 :provider, :uid, :oauth_token, :oauth_secret)
  end
end
