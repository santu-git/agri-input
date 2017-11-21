class BlocksController < ApplicationController
    before_action :set_subdivision
  
    # GET /districts
    # GET /districts.json
    def index
      @blocks = @subdivision.blocks
      @blocks = @blocks.map{|d| {id: d.id, name: d.name[@language]}}
    end
  
    private
      def set_subdivision
        @subdivision = Subdivision.find(params[:subdivision_id])
      end
      
  end
  