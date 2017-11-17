class ClientAuthentication
  prepend SimpleCommand
  def initialize(name, password)
    @name = name
    @password = password
  end

  def call
    JsonWebToken.encode(client_id: client.id) if client
  end

  private

  attr_accessor :name, :password

  def client
    client ||= Client.find_by(name: name)
    return client if client && client.authenticate(password)
    errors.add :client_authentication, 'invalid credentials'
    nil
  end

end
