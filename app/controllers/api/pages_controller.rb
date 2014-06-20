class API::PagesController < ApplicationController
  before_action :find_page, only: [:show, :update, :destroy]
  
  def index
    @response[:data] = Page.all()
  end
  
  def show
    @response[:data] = @page
  end
  
  def create
    page = Page.create(page_params)
    if page.valid? 
      @response[:data] = page
      @response_status = 201
    else
      @response_status = 400
    end
    
  end
  
  def update
    if not @page.update_attributes(page_params)
      @response_status = 400
    end
  end
  
  def destroy
    @page.destroy
  end
  
  private
  
  def find_page
    @page = Page.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @response_status = 404
      @response[:error] = 'Page not found'
      render_response
  end
  
  def page_params
    params.require(:page).permit(:title, :content)
  end
end
