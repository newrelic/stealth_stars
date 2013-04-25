class OperativesController < ApplicationController
  def index
    @operatives = Operative.includes(:missions).limit(50).all

    respond_to do |format|
      format.json { render :json => @operatives.to_json(:include => :missions ) }
    end
  end
end