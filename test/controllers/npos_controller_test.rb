require 'test_helper'

class NposControllerTest < ActionController::TestCase
  setup do
    @npo = npos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:npos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create npo" do
    assert_difference('Npo.count') do
      post :create, npo: { address: @npo.address, email: @npo.email, name: @npo.name, phone: @npo.phone, rate: @npo.rate }
    end

    assert_redirected_to npo_path(assigns(:npo))
  end

  test "should show npo" do
    get :show, id: @npo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @npo
    assert_response :success
  end

  test "should update npo" do
    patch :update, id: @npo, npo: { address: @npo.address, email: @npo.email, name: @npo.name, phone: @npo.phone, rate: @npo.rate }
    assert_redirected_to npo_path(assigns(:npo))
  end

  test "should destroy npo" do
    assert_difference('Npo.count', -1) do
      delete :destroy, id: @npo
    end

    assert_redirected_to npos_path
  end
end
