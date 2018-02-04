class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private


  def authenticate_request
    if request.headers[:Authorization].nil?
      return render json: { error: 'Not Authorized Missing Header' }, status: 401
    end
    decoded = JasonWebTokenModule::decode(request.headers[:Authorization])
    if decoded.nil? || decoded[:user_id].nil?
      return render json: { error: 'Not Authorized Invalid Token' }, status: 401
    end
    @current_user = User.find(decoded[:user_id])
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
