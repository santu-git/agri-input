class DistrictsController < ApplicationController
  before_action :set_state

  # GET /districts
  # GET /districts.json
  def index
    @districts = @state.districts
    @districts = @districts.map{|d| {id: d.id, name: d.name[@language]}}
  end

  private
    def set_state
      @state = State.find(params[:state_id])
    end
    
end
