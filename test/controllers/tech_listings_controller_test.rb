require 'test_helper'

class TechListingsControllerTest < ActionController::TestCase
  setup do
    @tech_listing = tech_listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tech_listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tech_listing" do
    assert_difference('TechListing.count') do
      post :create, tech_listing: { description: @tech_listing.description, flagged: @tech_listing.flagged, name: @tech_listing.name, source: @tech_listing.source, source_url: @tech_listing.source_url, submitted: @tech_listing.submitted, timestamps: @tech_listing.timestamps, url: @tech_listing.url }
    end

    assert_redirected_to tech_listing_path(assigns(:tech_listing))
  end

  test "should show tech_listing" do
    get :show, id: @tech_listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tech_listing
    assert_response :success
  end

  test "should update tech_listing" do
    patch :update, id: @tech_listing, tech_listing: { description: @tech_listing.description, flagged: @tech_listing.flagged, name: @tech_listing.name, source: @tech_listing.source, source_url: @tech_listing.source_url, submitted: @tech_listing.submitted, timestamps: @tech_listing.timestamps, url: @tech_listing.url }
    assert_redirected_to tech_listing_path(assigns(:tech_listing))
  end

  test "should destroy tech_listing" do
    assert_difference('TechListing.count', -1) do
      delete :destroy, id: @tech_listing
    end

    assert_redirected_to tech_listings_path
  end
end
