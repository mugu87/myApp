# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  height                 :integer
#  weight                 :integer
#  user_type              :string(255)
#  name                   :string(255)
#  gender                 :string(255)
#  dob                    :date
#  company_id             :integer
#  provider               :string(255)
#  uid                    :string(255)
#  oauth_token            :string(255)
#  oauth_secret           :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, 
  :omniauthable, :omniauth_providers => [:fitbit]
  has_many :stats
  has_many :donations
  belongs_to :cause

  def get_calories_gained_on_date (date)

  end

  def get_calories_lost_on_date (date)

  end

  def get_calories_balance_on_date(date)
  end

  def update_stats    #TODO test this with new data being updated at the band
    client = self.fitbit_data
    myStats = self.stats
    lastestRecord = myStats.order("created_at").last #NOTE Should this be "created_at" or "update_at"

  end

  def self.find_for_fitbit_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
       provider:auth.provider,
       uid:auth.uid,
       name: auth['info']['full_name'],
       oauth_token: auth['credentials']['token'],
       oauth_secret: auth['credentials']['secret'],
       password:Devise.friendly_token[0,20]
       )
    end
    user
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  def fitbit_data
    raise "Account is not linked with a Fitbit account" unless linked?
    @client ||= Fitgem::Client.new(
      :consumer_key => ENV["FITBIT_CONSUMER_KEY"],
      :consumer_secret => ENV["FITBIT_CONSUMER_SECRET"],
      :token => oauth_token,
      :secret => oauth_secret,
      :user_id => uid
      )
  end

  def has_fitbit_data?
    !@client.nil?
  end

  def linked?
    oauth_token.present? && oauth_secret.present?
  end

end
