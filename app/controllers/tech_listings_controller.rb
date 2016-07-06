class TechListingsController < ApplicationController
  before_action :set_tech_listing, only: [:show, :edit, :update, :destroy]

  # GET /tech_listings
  # GET /tech_listings.json
  def index
    @tech_listings = TechListing.all
  end

  # GET /tech_listings/1
  # GET /tech_listings/1.json
  def show
  end

  # GET /tech_listings/new
  def new
    @tech_listing = TechListing.new
  end

  # GET /tech_listings/1/edit
  def edit
  end

  # POST /tech_listings
  # POST /tech_listings.json
  def create
    @tech_listing = TechListing.new(tech_listing_params)

    respond_to do |format|
      if @tech_listing.save
        format.html { redirect_to @tech_listing, notice: 'Tech listing was successfully created.' }
        format.json { render :show, status: :created, location: @tech_listing }
      else
        format.html { render :new }
        format.json { render json: @tech_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tech_listings/1
  # PATCH/PUT /tech_listings/1.json
  def update
    respond_to do |format|
      if @tech_listing.update(tech_listing_params)
        format.html { redirect_to @tech_listing, notice: 'Tech listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @tech_listing }
      else
        format.html { render :edit }
        format.json { render json: @tech_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tech_listings/1
  # DELETE /tech_listings/1.json
  def destroy
    @tech_listing.destroy
    respond_to do |format|
      format.html { redirect_to tech_listings_url, notice: 'Tech listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def flagged
    @tech_listings = TechListing.where(flagged: true)
    render "index"
  end

  def submitted
    @tech_listings = TechListing.where(submitted: true)
    render "index"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tech_listing
      @tech_listing = TechListing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tech_listing_params
      params.require(:tech_listing).permit(:name, :url, :source, :source_url, :description, :flagged, :submitted, :timestamps)
    end
end
