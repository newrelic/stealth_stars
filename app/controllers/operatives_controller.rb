class OperativesController < ApplicationController
  def index
    @operatives = Operative.includes(:missions).all

    respond_to do |format|
      format.json { render :json => @operatives.to_json(:include => :missions ) }
    end
  end
end