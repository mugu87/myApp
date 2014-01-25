class ChallengeSupportersController < ApplicationController
	before_action :set_supporter, :set_user



  def new
	  @challenge_supporter = ChallengeSupporter.new
	  @challenge = Challenge.new
  end

#
#  def edit
#  end

  def create
    @supporter = ChallengeSupporter.new(challenge_params)

    respond_to do |format|
      if @supporter.save
        format.html { redirect_to challenges_path, notice: 'Stat was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end


# NOTE no update for now. Once a challenge is created, it can only be destroyed
  #
#  def update
#    respond_to do |format|
#      if @stat.update(stat_params)
#        format.html { redirect_to @stat, notice: 'Stat was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: 'edit' }
#        format.json { render json: @stat.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /stats/1
  # DELETE /stats/1.json
  def destroy
    @supporter.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supporter
      @supporter = ChallengeSupporter.find(params[:id])
    end

	def set_user
	#	@user = User.find(paramsA
		raise params
	end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      #params.require(:).permit(:today_active_calories)
    end

end
