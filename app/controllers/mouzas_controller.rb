class MouzasController < ApplicationController
  before_action :set_block
  
  # GET /districts
  # GET /districts.json
  def index
    @mouzas = @block.mouzas
    @mouzas = @mouzas.map{|d| {id: d.id, name: d.name[@language]}}
  end

  private
    def set_block
      @block = Block.find(params[:block_id])
    end
      
  end
  