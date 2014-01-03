require 'spec_helper'

describe ApiController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'user_info'" do
    it "returns http success" do
      get 'user_info'
      response.should be_success
    end
  end

end
