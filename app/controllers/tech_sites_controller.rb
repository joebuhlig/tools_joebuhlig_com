require 'open-uri'
require 'nokogiri'
require 'uri'

class TechSitesController < ApplicationController
  before_action :set_tech_site, only: [:show, :edit, :update, :destroy]

  # GET /tech_sites
  # GET /tech_sites.json
  def index
    @tech_sites = TechSite.all
  end

  # GET /tech_sites/1
  # GET /tech_sites/1.json
  def show
  end

  # GET /tech_sites/new
  def new
    @tech_site = TechSite.new
  end

  # GET /tech_sites/1/edit
  def edit
  end

  # POST /tech_sites
  # POST /tech_sites.json
  def create
    @tech_site = TechSite.new(tech_site_params)

    respond_to do |format|
      if @tech_site.save
        format.html { redirect_to @tech_site, notice: 'Tech site was successfully created.' }
        format.json { render :show, status: :created, location: @tech_site }
      else
        format.html { render :new }
        format.json { render json: @tech_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tech_sites/1
  # PATCH/PUT /tech_sites/1.json
  def update
    respond_to do |format|
      if @tech_site.update(tech_site_params)
        format.html { redirect_to @tech_site, notice: 'Tech site was successfully updated.' }
        format.json { render :show, status: :ok, location: @tech_site }
      else
        format.html { render :edit }
        format.json { render json: @tech_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tech_sites/1
  # DELETE /tech_sites/1.json
  def destroy
    @tech_site.destroy
    respond_to do |format|
      format.html { redirect_to tech_sites_url, notice: 'Tech site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def scrape(reload = false)
    @tech_sites = TechSite.all
    @tech_sites.each do |tech_site|
      if tech_site.active
        doc = Nokogiri::HTML(open(tech_site.url))
        get_tech(tech_site, doc, reload)
        tech_site.first_scrape = false
        tech_site.save
      end
    end
  end

  def rescrape
    TechListing.destroy_all
    scrape(true)
    redirect_to "/tech/listings"
  end

  def dashboard
    @tech_sites_count = TechSite.all.count
    @tech_count = TechListing.all.count
    @flagged_count = TechListing.where(flagged: true).count
    @submitted_count = TechListing.where(submitted: true).count
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tech_site
      @tech_site = TechSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tech_site_params
      params.require(:tech_site).permit(:active, :name, :url, :subgroups, :subgroup_selector, :tech_selector, :tech_title_selector, :tech_link_selector, :tech_description_selector, :found_errors, :comments, :first_scrape)
    end

    def get_tech(tech_site, doc, reload)
      tech_flag = !reload
      techs = doc.css(tech_site.tech_selector)
      techs.each do |tech|
        tech_text = tech.css(tech_site.tech_title_selector).text
        tech_link = tech.css(tech_site.tech_link_selector)[0]['href']
        tech_description = tech.css(tech_site.tech_description_selector).text
        if !tech_link.start_with?("http")
          uri = URI.parse(tech_site.url)
          tech_link = "#{uri.scheme}://#{uri.host}" + tech_link
        end
        if TechListing.where(name: tech_text).blank?
          if tech_site.first_scrape?
            tech_flag = false
          end
          newtech = TechListing.create(name: tech_text, url: tech_link, source: tech_site.name, source_url: tech_site.url, description: tech_description, flagged: tech_flag, submitted: false)
        end
      end
    end
end
