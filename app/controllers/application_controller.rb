class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate

  private

  # Verifies if table has column from parameter.
  def sort_column(model_name)
    model_name.column_names.include?(params[:sort]) ? params[:sort] : model_name.column_names.first.to_s
  end
  
  # Verifies if the direction is ASC or DESC. If the parameter is something else, then the result is sorted ASC.
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  protected
  # Authenticate user by basic HTTP request. The username and password constants are stored at initializers/user.rb.
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == USER_ID && password == PASSWORD
      end
    end
end
