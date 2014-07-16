class PagesController < ApplicationController
  def home
  	 if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all.order('created_at DESC')
    end
  end

  def about
  end

  def contact
  end
end
