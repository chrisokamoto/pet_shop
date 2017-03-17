module ApiHelper
  def set_authorization_headers
    request.headers['Authorization'] = "Token token=#{Rails.application.secrets.api_token}"
  end
end
