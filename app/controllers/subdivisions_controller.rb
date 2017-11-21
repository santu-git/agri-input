class SubdivisionsController < ApplicationController
    before_action :set_district
  
    # GET /districts
    # GET /districts.json
    def index
      @subdivisions = @district.subdivisions
      @subdivisions = @subdivisions.map{|d| {id: d.id, name: d.name[@language]}}
    end
  
    private
      def set_district
        @district = District.find(params[:district_id])
      end
      
  end
  