require 'test_helper'

class TechSitesControllerTest < ActionController::TestCase
  setup do
    @tech_site = tech_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tech_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tech_site" do
    assert_difference('TechSite.count') do
      post :create, tech_site: { comments: @tech_site.comments, name: @tech_site.name, subgroup_selector: @tech_site.subgroup_selector, subgroups: @tech_site.subgroups, tech_selector: @tech_site.tech_selector, url: @tech_site.url }
    end

    assert_redirected_to tech_site_path(assigns(:tech_site))
  end

  test "should show tech_site" do
    get :show, id: @tech_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tech_site
    assert_response :success
  end

  test "should update tech_site" do
    patch :update, id: @tech_site, tech_site: { comments: @tech_site.comments, name: @tech_site.name, subgroup_selector: @tech_site.subgroup_selector, subgroups: @tech_site.subgroups, tech_selector: @tech_site.tech_selector, url: @tech_site.url }
    assert_redirected_to tech_site_path(assigns(:tech_site))
  end

  test "should destroy tech_site" do
    assert_difference('TechSite.count', -1) do
      delete :destroy, id: @tech_site
    end

    assert_redirected_to tech_sites_path
  end
end
