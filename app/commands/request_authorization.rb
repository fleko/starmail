class RequestAuthorization
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    @client = decoded_auth_token ? Client.find(decoded_auth_token[:client_id]) : nil
    @client || errors.add(:token, 'Invalid token') && nil
  end

  private

  attr_reader :headers

  def http_auth_header
    ret = nil
    if headers['Authorization'].present?
      ret = headers['Authorization'].split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    ret
  end
end
