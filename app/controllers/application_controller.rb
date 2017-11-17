class ApplicationController < ActionController::API
  before_action :authenticate_request

  attr_reader :current_client

  private

  def authenticate_request
    @current_client = RequestAuthorization.call(request.headers).result
    render json: { error: 'Client Not Authorized' }, status: 401 unless @current_client
  end

end
