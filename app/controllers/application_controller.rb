class ApplicationController < ActionController::API
  before_filter :create_response
  after_filter  :render_response
  
  private
  def create_response
    @response = {data: '', error: ''}
    @response_status = 200
  end
  
  def render_response
    render json: @response, status: @response_status
  end
end
